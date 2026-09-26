# bitriad (0.4)

* Email: <mailto:cornelioid@gmail.com>
* GitHub mirror: <https://github.com/cran/bitriad>

Run `revdepcheck::revdep_details(, "bitriad")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘bitriad-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: modes
     > ### Title: Actor and event node iteration and attribute querying and
     > ###   assignment
     > ### Aliases: modes V1 V2 actor_attr event_attr set_actor_attr
     > ###   set_event_attr V1<- V2<-
     > 
     > ### ** Examples
     > 
     > data(women_clique)
     > print(V1(women_clique))
     ── <vertex sequence> 5/10 · named · from bb1857e ───────────────────────────────
     [1] Miss A Miss B Miss C Miss D Miss E
     > print(V2(women_clique))
     ── <vertex sequence> 5/10 · named · from bb1857e ───────────────────────────────
     [1] Bridge   Dinner   Movies   Dance    Visiting
     > V1(women_clique)$label <- LETTERS[1:5]
     Error in `V1<-`(`*tmp*`, value = 1:5) : invalid indexing
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
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

# CINNA (1.2.2)

* GitHub mirror: <https://github.com/cran/CINNA>

Run `revdepcheck::revdep_details(, "CINNA")` for more info

## Newly broken

*   checking whether package ‘CINNA’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/CINNA.Rcheck/00install.out’ for details.
     ```

## Newly fixed

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘circlize’
       All declared Imports should be used.
     ```

## Installation

### Devel

```
* installing *source* package ‘CINNA’ ...
** this is package ‘CINNA’ version ‘1.2.2’
** package ‘CINNA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘%>%’ is not exported by 'namespace:igraph'
Execution halted
ERROR: lazy loading failed for package ‘CINNA’
* removing ‘/revdepx/out/CINNA.Rcheck/CINNA’


```
### CRAN

```
* installing *source* package ‘CINNA’ ...
** this is package ‘CINNA’ version ‘1.2.2’
** package ‘CINNA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (CINNA)


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

# EDOIF (0.1.4)

* GitHub: <https://github.com/DarkEyes/EDOIF>
* Email: <mailto:grandca@gmail.com>
* GitHub mirror: <https://github.com/cran/EDOIF>

Run `revdepcheck::revdep_details(, "EDOIF")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > # Generate simulation data
     > nInv<-100
     > initMean=10
     > stepMean=20
     > std=8
     > simData1<-c()
     > simData1$Values<-rnorm(nInv,mean=initMean,sd=std)
     > simData1$Group<-rep(c("C1"),times=nInv)
     > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean,sd=std) )
     > simData1$Group<-c(simData1$Group,rep(c("C2"),times=nInv))
     > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+2*stepMean,sd=std) )
     > simData1$Group<-c(simData1$Group,rep(c("C3"),times=nInv) )
     > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+3*stepMean,sd=std) )
     > simData1$Group<-c(simData1$Group, rep(c("C4"),times=nInv) )
     > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+4*stepMean,sd=std) )
     > simData1$Group<-c(simData1$Group, rep(c("C5"),times=nInv) )
     > 
     > # Performing ordering infernce from simData1
     > 
     > resultObj<-EDOIF(simData1$Values,simData1$Group)
     Error in graph_from_adjacency_matrix(adjMat) %>% set_vertex_attr("label",  : 
       could not find function "%>%"
     Calls: EDOIF -> getiGraphOBJ
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘EDOIF_demo.Rmd’ using knitr
     
     Quitting from EDOIF_demo.Rmd:33-45 [unnamed-chunk-1]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `graph_from_adjacency_matrix(adjMat) %>% set_vertex_attr("label", value = sortedGroupList)`:
     ! could not find function "%>%"
     ---
     Backtrace:
         ▆
      1. └─EDOIF::EDOIF(Values, Group, bootT = bootT, alpha = alpha)
      2.   └─EDOIF::getiGraphOBJ(out5$adjMat, out1$sortedGroupList)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'EDOIF_demo.Rmd' failed with diagnostics:
     could not find function "%>%"
     --- failed re-building ‘EDOIF_demo.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘EDOIF_demo.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     getiGraphOBJ: no visible global function definition for ‘%>%’
     plotGraph: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
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

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# glyrepr (1.1.0)

* GitHub: <https://github.com/glycoverse/glyrepr>
* Email: <mailto:23110220018@m.fudan.edu.cn>
* GitHub mirror: <https://github.com/cran/glyrepr>

Run `revdepcheck::revdep_details(, "glyrepr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-floating-substituents.R:94:1', 'test-floating-substituents.R:133:1',
         'test-floating-substituents.R:173:1', 'test-floating-validation.R:37:1',
         'test-floating-validation.R:51:1', 'test-floating-validation.R:65:1',
         'test-floating-validation.R:79:1', 'test-floating-validation.R:109:1',
         'test-floating-validation.R:139:1', 'test-floating-validation.R:159:1',
         'test-floating-validation.R:203:1', 'test-low-level-structure.R:46:1',
         'test-low-level-structure.R:82:1', 'test-low-level-structure.R:159:1',
         'test-low-level-structure.R:222:1', 'test-low-level-structure.R:236:1',
         'test-smap.R:1041:1', 'test-structure-arrays.R:53:1',
         'test-structure-arrays.R:137:1', 'test-structure-tables.R:497:1',
         'test-structure.R:574:1', 'test-structure.R:593:1', 'test-structure.R:642:1',
         'test-structure.R:662:1', 'test-structure.R:722:1', 'test-structure.R:729:1',
         'test-structure.R:737:1', 'test-structure.R:778:1', 'test-structure.R:833:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-structure-to-iupac.R:124:3'): structure_to_iupac handles complex branched structures ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(graphs, process_glycan_structure_element)`: i In index: 1.
       Caused by error in `validate_glycan_graph()`:
       ! Duplicated linkage positions.
       
       [ FAIL 1 | WARN 0 | SKIP 51 | PASS 2073 ]
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
     > 
     > ### ** Examples
     > 
     > library(igraph)
     
     Attaching package: ‘igraph’
     
     The following objects are masked from ‘package:stats’:
     
         decompose, spectrum
     
     The following object is masked from ‘package:base’:
     
         union
     
     > ## Example with known vertex cover
     > K25 <- make_full_graph(25)   # Cover of size 24
     > X0 <- build_cover_approx(K25)
     > X0$size  # 24
     [1] 24
     > plot_cover(X0, K25)
     Error in gcov %>% add_edges(t(eG[as.numeric(incident(G, v)), ])) : 
       could not find function "%>%"
     Calls: plot_cover
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     compute_lower_bound_1tree: no visible global function definition for
       ‘%>%’
     crossover_tours: no visible global function definition for ‘%>%’
     plot_cover: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

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

# manynet (2.3.4)

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
        5.   └─testthat::expect_null(...) at ./helper-manynet.R:233:5
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
        5.   └─testthat::expect_null(...) at ./helper-manynet.R:233:5
       
       [ FAIL 6 | WARN 767 | SKIP 90 | PASS 4996 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# mau (0.4.0)

* GitHub mirror: <https://github.com/cran/mau>

Run `revdepcheck::revdep_details(, "mau")` for more info

## Newly broken

*   checking whether package ‘mau’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/mau.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘mau’ ...
** this is package ‘mau’ version ‘0.4.0’
** package ‘mau’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘%>%’ is not exported by 'namespace:igraph'
Execution halted
ERROR: lazy loading failed for package ‘mau’
* removing ‘/revdepx/out/mau.Rcheck/mau’


```
### CRAN

```
* installing *source* package ‘mau’ ...
** this is package ‘mau’ version ‘0.4.0’
** package ‘mau’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (mau)


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

# migraph (1.7.0)

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
       
       [ FAIL 1 | WARN 0 | SKIP 3 | PASS 276 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# MRReg (0.1.6)

* GitHub: <https://github.com/DarkEyes/MRReg>
* Email: <mailto:grandca@gmail.com>
* GitHub mirror: <https://github.com/cran/MRReg>

Run `revdepcheck::revdep_details(, "MRReg")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     > # Plotting the result
     > plotOptimalClustersTree(obj)
     Error in graph_from_adjacency_matrix(adjMat) %>% set_vertex_attr("label",  : 
       could not find function "%>%"
     Calls: plotOptimalClustersTree
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘MDLResFramework_Demo.Rmd’ using knitr
     
     Quitting from MDLResFramework_Demo.Rmd:50-52 [unnamed-chunk-2]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `graph_from_adjacency_matrix(adjMat) %>% set_vertex_attr("label", value = nameList)`:
     ! could not find function "%>%"
     ---
     Backtrace:
         ▆
      1. └─MRReg::plotOptimalClustersTree(out)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'MDLResFramework_Demo.Rmd' failed with diagnostics:
     could not find function "%>%"
     --- failed re-building ‘MDLResFramework_Demo.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘MDLResFramework_Demo.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     plotOptimalClustersTree: no visible global function definition for
       ‘%>%’
     Undefined global functions or variables:
       %>%
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

## Newly fixed

*   checking for detritus in the temp directory ... NOTE
     ```
     Found the following files/directories:
       ‘org.chromium.Chromium.5hUvPq’
     ```

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

# NetOrigin (1.1-7)

* GitHub: <https://github.com/jmanitz/NetOrigin>
* Email: <mailto:r@manitz.org>
* GitHub mirror: <https://github.com/cran/NetOrigin>

Run `revdepcheck::revdep_details(, "NetOrigin")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘NetOrigin-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: origin-methods
     > ### Title: methods for origin estimation objects of class 'origin'
     > ### Aliases: origin-methods print.origin summary.origin plot.origin
     > ###   performance.origin
     > 
     > ### ** Examples
     > 
     > data(ptnGoe)
     > data(delayGoe)
     > 
     > res <- origin(events=delayGoe[10,-c(1:2)], type='centrality', graph=ptnGoe)
     This graph was created by an old(er) igraph version.
     ℹ Call `igraph::upgrade_graph()` on it to use with the current igraph version.
     For now we convert it on the fly...
     Error in aux %>% dplyr::filter(events > 0) %>% dplyr::select(id) : 
       could not find function "%>%"
     Calls: origin -> origin_centrality
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     origin_backtracking: no visible global function definition for ‘%>%’
     origin_centrality: no visible global function definition for ‘%>%’
     origin_edm: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

# netrics (1.0.3)

* GitHub: <https://github.com/stocnet/netrics>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/netrics>

Run `revdepcheck::revdep_details(, "netrics")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-measure_net.R:6:7'
       • grepl("tie_is_imbalanced", fn) && ob == "twomode" is TRUE (1):
         'test-mark_ties.R:5:7'
       • grepl("triad", fn) && is_twomode(data_objs[[ob]]) is TRUE (1):
         'test-motif_net.R:6:7'
       • grepl("triad|dyad", fn) && is_twomode(data_objs[[ob]]) is TRUE (2):
         'test-motif_nodes.R:5:7', 'test-motif_nodes.R:5:7'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-member_community.R:65:3'): every k-capable algorithm returns exactly k communities ──
       Expected the warnings and messages raised to match regexp "communities".
       Actual text:
       x | 
       Backtrace:
           ▆
        1. ├─testthat::expect_s3_class(...) at test-member_community.R:65:3
        2. │ └─testthat::quasi_label(enquo(object))
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─netrics:::expect_snet_warn(...)
        5.   └─testthat::expect_match(...) at ./helper-netrics.R:46:3
       
       [ FAIL 1 | WARN 0 | SKIP 38 | PASS 2774 ]
       Error:
       ! Test failures.
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

# pomdp (1.2.7)

* GitHub mirror: <https://github.com/cran/pomdp>

Run `revdepcheck::revdep_details(, "pomdp")` for more info

## Newly broken

*   checking whether package ‘pomdp’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/pomdp.Rcheck/00install.out’ for details.
     ```

## Newly fixed

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

## Installation

### Devel

```
* installing *source* package ‘pomdp’ ...
** this is package ‘pomdp’ version ‘1.2.7’
** package ‘pomdp’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
specified C++17
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
using C++17
g++ -std=gnu++17 -I"/usr/local/lib/R/include" -DNDEBUG  -I'/opt/revdepx/lib/Rcpp/include' -I/usr/local/include    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -g0  -c POMDP.cpp -o POMDP.o
g++ -std=gnu++17 -I"/usr/local/lib/R/include" -DNDEBUG  -I'/opt/revdepx/lib/Rcpp/include' -I/usr/local/include    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -g0  -c RcppExports.cpp -o RcppExports.o
...
g++ -std=gnu++17 -shared -L/usr/local/lib/R/lib -L/usr/local/lib -o pomdp.so POMDP.o RcppExports.o math.o model.o sample_simplex.o simulate_MDP.o simulate_POMDP.o -L/usr/local/lib/R/lib -lR
installing to /revdepx/out/pomdp.Rcheck/00LOCK-pomdp/00new/pomdp/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘%>%’ is not exported by 'namespace:igraph'
Execution halted
ERROR: lazy loading failed for package ‘pomdp’
* removing ‘/revdepx/out/pomdp.Rcheck/pomdp’


```
### CRAN

```
* installing *source* package ‘pomdp’ ...
** this is package ‘pomdp’ version ‘1.2.7’
** package ‘pomdp’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
specified C++17
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
using C++17
g++ -std=gnu++17 -I"/usr/local/lib/R/include" -DNDEBUG  -I'/opt/revdepx/lib/Rcpp/include' -I/usr/local/include    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -g0  -c POMDP.cpp -o POMDP.o
g++ -std=gnu++17 -I"/usr/local/lib/R/include" -DNDEBUG  -I'/opt/revdepx/lib/Rcpp/include' -I/usr/local/include    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -g0  -c RcppExports.cpp -o RcppExports.o
...
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (pomdp)


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

# RNAseqNet (0.1.5)

* Email: <mailto:nathalie.vialaneix@inrae.fr>
* GitHub mirror: <https://github.com/cran/RNAseqNet>

Run `revdepcheck::revdep_details(, "RNAseqNet")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘RNAseqNet-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: GLMnetwork
     > ### Title: Infer a network from RNA-seq expression.
     > ### Aliases: GLMnetwork
     > 
     > ### ** Examples
     > 
     > data(lung)
     > lambdas <- 4 * 10^(seq(0, -2, length = 10))
     > ref_lung <- GLMnetwork(lung, lambdas = lambdas)
     Error in lapply(all_glms, function(alist) alist[, indl]) %>% unlist() : 
       could not find function "%>%"
     Calls: GLMnetwork -> lapply -> FUN
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     GLMnetwork : <anonymous>: no visible global function definition for
       ‘%>%’
     chooseSigma: no visible global function definition for ‘%>%’
     imputedGLMnetwork: no visible global function definition for ‘%>%’
     stabilitySelection: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

# Rnmr1D (1.3.2)

* GitHub: <https://github.com/INRA/Rnmr1D>
* Email: <mailto:daniel.jacob@inrae.fr>
* GitHub mirror: <https://github.com/cran/Rnmr1D>

Run `revdepcheck::revdep_details(, "Rnmr1D")` for more info

## Newly broken

*   checking R code for possible problems ... NOTE
     ```
     ggplotPlotly: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘impute’
       All declared Imports should be used.
     ```

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# rSDI (0.2.2)

* GitHub: <https://github.com/ehengirmen/rSDI>
* Email: <mailto:mehmetgencer@yahoo.com>
* GitHub mirror: <https://github.com/cran/rSDI>

Run `revdepcheck::revdep_details(, "rSDI")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘rSDI.Rmd’ using rmarkdown
     
     Quitting from rSDI.Rmd:186-194 [multi.metric.example]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `toyGraph %>% SDI(variant = "nuw") %>% SDI(variant = "niu") %>% SDI(variant = "vuw") %>%
         SDI(variant = "vuu")`:
     ! could not find function "%>%"
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'rSDI.Rmd' failed with diagnostics:
     could not find function "%>%"
     --- failed re-building ‘rSDI.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘rSDI.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# RSP (1.0.0)

* Email: <mailto:erencan@aybek.net>
* GitHub mirror: <https://github.com/cran/RSP>

Run `revdepcheck::revdep_details(, "RSP")` for more info

## Newly broken

*   checking R code for possible problems ... NOTE
     ```
     CFA : server : build_cfa_visnetwork: no visible global function
       definition for ‘%>%’
     CFA : server: no visible global function definition for ‘%>%’
     FA : server : apply_loading_cutoff_style: no visible global function
       definition for ‘%>%’
     FA : server: no visible global function definition for ‘%>%’
     INTERNAL : server : style_summary_gt: no visible global function
       definition for ‘%>%’
     INTERNAL : server: no visible global function definition for ‘%>%’
     INTERNAL : server : make_plotly_bar: no visible global function
       definition for ‘%>%’
     INTERNAL : server : make_plotly_bar2: no visible global function
       definition for ‘%>%’
     IRT : server: no visible global function definition for ‘%>%’
     ITEMAN : <anonymous>: no visible global function definition for ‘%>%’
     ITEMAN : server: no visible global function definition for ‘%>%’
     PCA : server : apply_loading_cutoff_style: no visible global function
       definition for ‘%>%’
     PCA : server: no visible global function definition for ‘%>%’
     SIMDATA : server : styled_gt: no visible global function definition for
       ‘%>%’
     SIMDATA : server: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
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

# sfclust (1.1.1)

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

# soptdmaeA (1.0.1)

* Email: <mailto:diboobayu@gmail.com>
* GitHub mirror: <https://github.com/cran/soptdmaeA>

Run `revdepcheck::revdep_details(, "soptdmaeA")` for more info

## Newly broken

*   checking R code for possible problems ... NOTE
     ```
     graphsoptd.mae: no visible global function definition for ‘%>%’
     summary.soptdmaeA: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
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

# SurvHiDim (0.1.1)

* Email: <mailto:atanustat@gmail.com>
* GitHub mirror: <https://github.com/cran/SurvHiDim>

Run `revdepcheck::revdep_details(, "SurvHiDim")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘SurvHiDim-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: hidimSurvlas
     > ### Title: hidimSurvlas Two step filteration without bonferroni correction
     > ### Aliases: hidimSurvlas
     > 
     > ### ** Examples
     > 
     > ##
     > data(hnscc)
     > hidimSurvlas(7,105,0.05,ID="id",OS="os",Death="death",PFS="pfs",Prog="prog",hnscc)
     Error in commondata2 %>% data.matrix() : could not find function "%>%"
     Calls: hidimSurvlas
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     hidimSurvbonlas: no visible global function definition for ‘%>%’
     hidimSurvlas: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘readr’
       All declared Imports should be used.
     ```

# threejs (0.3.4)

* GitHub: <https://github.com/bwlewis/rthreejs>
* Email: <mailto:blewis@illposed.net>
* GitHub mirror: <https://github.com/cran/threejs>

Run `revdepcheck::revdep_details(, "threejs")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > r     <- 1.0
     > x <- (R + r * cos(theta)) * cos(phi)
     > y <- (R + r * cos(theta)) * sin(phi)
     > z <- r * sin(theta)
     > d <- 6
     > h <- 6
     > t <- 2 * runif (N) - 1
     > w <- t^2 * sqrt(1 - t^2)
     > x1 <- d * cos(theta) * sin(phi) * w
     > y1 <- d * sin(theta) * sin(phi) * w
     > i <- order(phi)
     > j <- order(t)
     > col <- c( rainbow(length(phi))[order(i)],
     +          rainbow(length(t), start=0, end=2/6)[order(j)])
     > M <- cbind(x=c(x, x1), y=c(y, y1), z=c(z, h*t))
     > scatterplot3js(M, size=0.5, color=col, bg="black", pch=".")
     > 
     > # Plot generic text using 'pch' (we label some points in this example)
     > set.seed(1)
     > x <- rnorm(5); y <- rnorm(5); z <- rnorm(5)
     > scatterplot3js(x, y, z, pch="@") %>%
     +    points3d(x + 0.1, y + 0.1, z, color="red", pch=paste("point", 1:5))
     Error in scatterplot3js(x, y, z, pch = "@") %>% points3d(x + 0.1, y +  : 
       could not find function "%>%"
     Execution halted
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
       
       [ FAIL 6 | WARN 55 | SKIP 1 | PASS 423 ]
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

