# beastier (2.5.2)

* GitHub: <https://github.com/ropensci/beastier>
* Email: <mailto:rjcbilderbeek@gmail.com>
* GitHub mirror: <https://github.com/cran/beastier>

Run `revdepcheck::revdep_details(, "beastier")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +           filename = tracelog_filename
     +         )
     +       )
     +     )
     +   )
     +   extract_tracelog_filename_from_beast2_input_file(
     +     input_filename = beast2_input_filename
     +   )
     +   file.remove(beast2_input_filename)
     + 
     +   remove_beaustier_folders()
     + }
     Error:
     ! '/home/runner/.cache/beastier/file28625282cbbbf' does not exist.
     Backtrace:
         ▆
      1. ├─beastier::extract_tracelog_filename_from_beast2_input_file(input_filename = beast2_input_filename)
      2. │ └─readr::read_lines(input_filename, progress = FALSE)
      3. │   └─vroom::vroom_lines(...)
      4. │     └─vroom:::vroom_(...)
      5. └─vroom (local) `<fn>`("/home/runner/.cache/beastier/file28625282cbbbf")
      6.   └─vroom:::check_path(path)
      7.     └─cli::cli_abort(msg, call = call)
      8.       └─rlang::abort(...)
     Execution halted
     ```

# BeeBDC (1.3.4)

* GitHub: <https://github.com/jbdorey/BeeBDC>
* Email: <mailto:jbdorey@me.com>
* GitHub mirror: <https://github.com/cran/BeeBDC>

Run `revdepcheck::revdep_details(, "BeeBDC")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       are planar
        - Downloading taxonomy...
       Saving _problems/test-taxadbToBeeBDC-18.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 248 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-taxadbToBeeBDC.R:10:2'): (code run outside of `test_that()`) ───
       <EEXIST/fs_error/error/condition>
       Error: [EEXIST] Failed to copy '/home/runner/work/_temp/tmp/RtmpBlJICk/working_dir/RtmpI0P6Zm/file48e41257ae826parquet' to '/home/runner/.local/share/R/contentid/sha256/e4/a6/e4a60b68c986c27eeee0318a876f9a86cd8f452a6a77db3bf38b934862b7ce27': file already exists
       Backtrace:
           ▆
        1. └─BeeBDC::taxadbToBeeBDC(...) at test-taxadbToBeeBDC.R:10:2
        2.   └─taxadb::td_create(...)
        3.     └─taxadb:::cache_urls(meta$url, meta$id)
        4.       └─base::vapply(...)
        5.         └─contentid (local) FUN(X[[i]], ...)
        6.           └─contentid::store(path, dir = dir, algos = algo)
        7.             └─base::vapply(...)
        8.               └─contentid (local) FUN(X[[i]], ...)
        9.                 └─fs::file_copy(filepath, dest)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 248 ]
       Error:
       ! Test failures.
       Execution halted
     ```

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
       
               `actual`: 0 0 1 1 0 1 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0
       `expected[2:16]`: 0 0 1 1 0 0 0 0 1 0 1 0 0 0                     0
       
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 204 ]
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
      4.     └─lifecycle::deprecate_stop("2.1.0", "layout.spring()", "layout_with_fr()") at igraph/R/layout.R:3436:3
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
      4.     └─lifecycle::deprecate_stop(...) at igraph/R/centrality.R:1493:7
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
      21.       └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )") at igraph/R/structural-properties.R:3771:5
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
       
       [ FAIL 3 | WARN 0 | SKIP 2 | PASS 45 ]
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
      23.       └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )") at igraph/R/structural-properties.R:3771:5
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
      18.                       └─lifecycle::deprecate_stop("2.0.0", "hub.score()", "hits_scores()") at igraph/R/centrality.R:71:3
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
        11.               └─lifecycle::deprecate_stop("2.0.0", "hub.score()", "hits_scores()") at igraph/R/centrality.R:71:3
        12.                 └─lifecycle:::deprecate_stop0(msg)
        13.                   └─rlang::cnd_signal(...)
       
       [ FAIL 3 | WARN 4 | SKIP 0 | PASS 96 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# eHDPrep (1.4.0)

* GitHub: <https://github.com/overton-group/eHDPrep>
* Email: <mailto:I.Overton@qub.ac.uk>
* GitHub mirror: <https://github.com/cran/eHDPrep>

Run `revdepcheck::revdep_details(, "eHDPrep")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     tlmgr: package log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr.log
     tlmgr: command log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr-commands.log
     tlmgr: package repository https://tlnet.yihui.org (verified)
     [1/1, ??:??/??:??] install: ulem [7k]
     running mktexlsr ...
     done running mktexlsr.
     tlmgr: package log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr.log
     tlmgr: command log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr-commands.log
     tlmgr: package repository https://tlnet.yihui.org (verified)
     [1/1, ??:??/??:??] install: makecell [5k]
     running mktexlsr ...
     done running mktexlsr.
     tlmgr: package log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr.log
     tlmgr: command log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr-commands.log
     ! pdflatex: fatal: Could not undump 41 1-byte item(s) from /home/runner/.TinyTeX/texmf-var/web2c/pdftex/pdflatex.fmt.
     
     Error: processing vignette 'Introduction_to_eHDPrep.Rmd' failed with diagnostics:
     LaTeX failed to compile <lib>/eHDPrep.Rcheck/vign_test/eHDPrep/vignettes/Introduction_to_eHDPrep.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See Introduction_to_eHDPrep.log for more info.
     --- failed re-building ‘Introduction_to_eHDPrep.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘Introduction_to_eHDPrep.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# fsbrain (0.6.0)

* GitHub: <https://github.com/dfsp-spirit/fsbrain>
* Email: <mailto:ts+code@rcmd.org>
* GitHub mirror: <https://github.com/cran/fsbrain>

Run `revdepcheck::revdep_details(, "fsbrain")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-morph_concat.R:42:5', 'test-morph_concat.R:59:5',
         'test-r_vis_volume.R:2:5', 'test-r_vis_volume.R:36:5',
         'test-r_vis_volume.R:124:5', 'test-r_vis_volume.R:157:5',
         'test-r_vis_volume.R:212:5', 'test-rglactions.R:3:5',
         'test-rglactions.R:16:5', 'test-seg_stats.R:4:5', 'test-seg_stats.R:20:5',
         'test-smooth.R:3:5', 'test-smooth.R:36:5', 'test-u_vis_volume_3d.R:4:5',
         'test-u_vis_volume_3d.R:43:5', 'test-u_vis_volume_3d.R:56:5',
         'test-u_vis_volume_3d.R:64:5', 'test-u_vis_volume_3d.R:74:5',
         'test-u_vis_volume_3d.R:83:5', 'test-u_vis_volume_3d.R:125:5',
         'test-u_vis_volume_3d.R:169:5', 'test-u_vis_volume_3d.R:190:5',
         'test-u_vis_volume_3d.R:209:5'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-helpers.R:22:3'): The neigborhood of a vertex is computed correctly ──
       Error in `pkgfilecache::get_filepath(pkg_info, filename, mustWork = mustWork)`: File 'subjects_dir' (from 'subjects_dir') does not exist in local package cache at '~/.local/share/fsbrain/subjects_dir', and mustWork is TRUE.
       
       Backtrace:
           ▆
        1. └─fsbrain::get_optional_data_filepath("subjects_dir") at test-helpers.R:22:3
        2.   └─pkgfilecache::get_filepath(pkg_info, filename, mustWork = mustWork)
       
       [ FAIL 1 | WARN 86 | SKIP 91 | PASS 325 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# ggm (2.5.4)

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
      4.       └─lifecycle::deprecate_stop("3.0.0", "tkplot()") at igraph/R/tkplot.R:329:3
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking examples with --run-donttest ... ERROR
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
      4.       └─lifecycle::deprecate_stop("3.0.0", "tkplot()") at igraph/R/tkplot.R:329:3
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

## Newly fixed

*   checking package dependencies ... ERROR
     ```
     Package required but not available: ‘graph’
     
     See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
     manual.
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
      16.         └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )") at igraph/R/structural-properties.R:3771:5
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

# glyrepr (0.14.0)

* GitHub: <https://github.com/glycoverse/glyrepr>
* Email: <mailto:23110220018@m.fudan.edu.cn>
* GitHub mirror: <https://github.com/cran/glyrepr>

Run `revdepcheck::revdep_details(, "glyrepr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       [ FAIL 1 | WARN 0 | SKIP 21 | PASS 1300 ]
       
       ══ Skipped tests (21) ══════════════════════════════════════════════════════════
       • On CRAN (21): 'test-composition.R:298:1', 'test-composition.R:325:1',
         'test-example-glycans.R:1:1', 'test-example-glycans.R:9:1',
         'test-example-glycans.R:16:1', 'test-example-glycans.R:23:1',
         'test-example-glycans.R:30:1', 'test-low-level-structure.R:40:1',
         'test-low-level-structure.R:67:1', 'test-low-level-structure.R:81:1',
         'test-low-level-structure.R:95:1', 'test-structure-level.R:71:1',
         'test-structure-level.R:152:1', 'test-structure.R:495:1',
         'test-structure.R:514:1', 'test-structure.R:563:1', 'test-structure.R:573:1',
         'test-structure.R:582:1', 'test-structure.R:642:1', 'test-structure.R:649:1',
         'test-structure.R:657:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-structure-to-iupac.R:95:3'): structure_to_iupac handles complex branched structures ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(valid_graphs, function(graph) {     checkmate::assert_class(graph, "igraph")     graph %>% validate_glycan_graph() %>% canonicalize_glycan_graph() })`: i In index: 1.
       Caused by error in `validate_glycan_graph()`:
       ! Duplicated linkage positions.
       
       [ FAIL 1 | WARN 0 | SKIP 21 | PASS 1300 ]
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
       7.             └─igraph::get_edge_ids(...) at igraph/R/interface.R:756:3
       8.               └─igraph:::el_to_vec(vp, call = rlang::caller_env()) at igraph/R/interface.R:716:3
       9.                 └─lifecycle::deprecate_stop(...) at igraph/R/interface.R:600:7
      10.                   └─lifecycle:::deprecate_stop0(msg)
      11.                     └─rlang::cnd_signal(...)
     Execution halted
     ```

# manynet (2.2.3)

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
       
       Warning in expression 46 : mean(as_matrix(s_women))
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_manynet.R:4:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─manynet:::check_tute_functions(tute)
        5.   └─testthat::expect_null(...) at ./helper-manynet.R:225:5
       
       [ FAIL 2 | WARN 644 | SKIP 78 | PASS 3303 ]
       Error:
       ! Test failures.
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
       8.         └─lifecycle::deprecate_stop("2.2.0", "dfs(father = )", "dfs(parent = )") at igraph/R/structural-properties.R:4047:5
       9.           └─lifecycle:::deprecate_stop0(msg)
      10.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         7.       └─igraph::dfs(x, root = origin, father = TRUE, mode = "all")
         8.         └─lifecycle::deprecate_stop("2.2.0", "dfs(father = )", "dfs(parent = )") at igraph/R/structural-properties.R:4047:5
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
        7.     └─lifecycle::deprecate_stop("2.2.0", "dfs(father = )", "dfs(parent = )") at igraph/R/structural-properties.R:4047:5
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
       9.           └─lifecycle::deprecate_stop("2.2.0", "dfs(father = )", "dfs(parent = )") at igraph/R/structural-properties.R:4047:5
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
       ‘com.google.Chrome.3ecrYW’
     ```

# netrics (0.4.0)

* GitHub: <https://github.com/stocnet/netrics>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/netrics>

Run `revdepcheck::revdep_details(, "netrics")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-motif_net.R:6:7'
       • grepl("triad|dyad", fn) && is_twomode(data_objs[[ob]]) is TRUE (2):
         'test-motif_nodes.R:5:7', 'test-motif_nodes.R:5:7'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-tutorials_netrics.R:4:5'): netrics tutorial code runs without warnings or errors ──
       Expected `w` to be NULL.
       Differences:
       `actual` is an S3 object of class <lifecycle_warning_deprecated/rlang_warning/warning/condition>, a list
       `expected` is NULL
       
       Warning in expression 18 : (graphr(create_ring(50, width = 2), "circle") + ggtitle("The Ring Two", 
       Warning in expression 18 :     subtitle = "No different?"))
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_netrics.R:4:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─netrics:::check_tute_functions(tute)
        5.   └─testthat::expect_null(...) at ./helper-netrics.R:190:5
       
       [ FAIL 1 | WARN 0 | SKIP 41 | PASS 1803 ]
       Error:
       ! Test failures.
       Execution halted
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

# rdwd (1.9.17)

* GitHub: <https://github.com/brry/rdwd>
* Email: <mailto:berry-b@gmx.de>
* GitHub mirror: <https://github.com/cran/rdwd>

Run `revdepcheck::revdep_details(, "rdwd")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘rdwd-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: plotDWD
     > ### Title: Quickly plot time series
     > ### Aliases: plotDWD
     > ### Keywords: hplot
     > 
     > ### ** Examples
     > 
     > link <- selectDWD("Potsdam", res="daily", var="kl", per="r")
     > clim <- dataDWD(link, dir=locdir(), varnames=TRUE)
     dataDWD -> dirDWD: adding to directory '/home/runner/.cache/R/rdwd'
     dataDWD: 1 file already existing and not downloaded again:  'daily_kl_recent_tageswerte_KL_03987_akt.zip'
     Now downloading 0 files...
     Reading 1 file with readDWD.data() and fread=TRUE ...
     Error: dataDWD -> readDWD -> lapply -> FUN: failure reading file:
     /home/runner/.cache/R/rdwd/daily_kl_recent_tageswerte_KL_03987_akt.zip
     Error in unzip(file, list = TRUE) : 
       zip file '/home/runner/.cache/R/rdwd/daily_kl_recent_tageswerte_KL_03987_akt.zip' cannot be opened
     Execution halted
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
# SEMgraph (1.2.4)

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
        [4] 0.17     - 1.00       [4] 
        [5] 0.15     - 1.00       [5] 
        [6] 0.35     - 1.00       [6] 
        [7] 0.35     - 1.00       [7] 
        [8] 0.19     - 1.00       [8] 
        [9] 0.00     - 1.00       [9] 
       [10] 0.15     - 1.00       [10]
       [11] 0.19     - 1.00       [11]
       [12] 0.07     - 1.00       [12]
       [13] 0.39     - 1.00       [13]
       [14] 0.10     - 1.00       [14]
       [15] 0.39     - 1.00       [15]
       [16] 0.00     - 1.00       [16]
       [17] 0.07     - 1.00       [17]
       [18] 0.11     - 1.00       [18]
       [19] 0.10     - 1.00       [19]
       [20] 0.11     - 1.00       [20]
       [21] 0.55     - 1.00       [21]
       [22] 0.55     - 1.00       [22]
       
       
       [ FAIL 11 | WARN 0 | SKIP 8 | PASS 119 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# spacemodR (0.1.3)

* Email: <mailto:virgile.baudrot@qonfluens.com>
* GitHub mirror: <https://github.com/cran/spacemodR>

Run `revdepcheck::revdep_details(, "spacemodR")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     17: withRestartList(expr, restarts)
     18: withRestarts(with_handlers({    for (expr in tle$exprs) {        ev <- withVisible(eval(expr, envir))        watcher$capture_plot_and_output()        watcher$print_value(ev$value, ev$visible, envir)    }    TRUE}, handlers), eval_continue = function() TRUE, eval_stop = function() FALSE)
     19: evaluate::evaluate(...)
     20: evaluate(code, envir = env, new_device = FALSE, keep_warning = if (is.numeric(options$warning)) TRUE else options$warning,     keep_message = if (is.numeric(options$message)) TRUE else options$message,     stop_on_error = if (is.numeric(options$error)) options$error else {        if (options$error && options$include)             0L        else 2L    }, output_handler = knit_handlers(options$render, options))
     21: in_dir(input_dir(), expr)
     22: in_input_dir(evaluate(code, envir = env, new_device = FALSE,     keep_warning = if (is.numeric(options$warning)) TRUE else options$warning,     keep_message = if (is.numeric(options$message)) TRUE else options$message,     stop_on_error = if (is.numeric(options$error)) options$error else {        if (options$error && options$include)             0L        else 2L    }, output_handler = knit_handlers(options$render, options)))
     23: eng_r(options)
     24: block_exec(params)
     25: call_block(x)
     26: process_group(group)
     27: withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        if (progress && is.function(pb$interrupt))             pb$interrupt()        if (is_R_CMD_build() || is_R_CMD_check())             error <<- format(e)    })
     28: with_options(withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        if (progress && is.function(pb$interrupt))             pb$interrupt()        if (is_R_CMD_build() || is_R_CMD_check())             error <<- format(e)    }), list(rlang_trace_top_env = knit_global()))
     29: xfun:::handle_error(with_options(withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        if (progress && is.function(pb$interrupt))             pb$interrupt()        if (is_R_CMD_build() || is_R_CMD_check())             error <<- format(e)    }), list(rlang_trace_top_env = knit_global())), function(loc) {    setwd(wd)    write_utf8(res, output %n% stdout())    paste0("\nQuitting from ", loc, if (!is.null(error))         paste0("\n", rule(), error, "\n", rule()))}, if (labels[i] != "") sprintf(" [%s]", labels[i]), get_loc)
     30: process_file(text, output)
     31: knitr::knit(knit_input, knit_output, envir = envir, quiet = quiet)
     32: rmarkdown::render(file, encoding = encoding, quiet = quiet, envir = globalenv(),     output_dir = getwd(), ...)
     33: vweave_rmarkdown(...)
     34: engine$weave(file, quiet = quiet, encoding = enc)
     35: doTryCatch(return(expr), name, parentenv, handler)
     36: tryCatchOne(expr, names, parentenv, handlers[[1L]])
     37: tryCatchList(expr, classes, parentenv, handlers)
     38: tryCatch({    engine$weave(file, quiet = quiet, encoding = enc)    setwd(startdir)    output <- find_vignette_product(name, by = "weave", engine = engine)    if (!have.makefile && vignette_is_tex(output)) {        texi2pdf(file = output, clean = FALSE, quiet = quiet)        output <- find_vignette_product(name, by = "texi2pdf",             engine = engine)    }    outputs <- c(outputs, output)}, error = function(e) {    thisOK <<- FALSE    fails <<- c(fails, file)    message(gettextf("Error: processing vignette '%s' failed with diagnostics:\n%s",         file, conditionMessage(e)))})
     39: tools::buildVignettes(dir = "<lib>/spacemodR.Rcheck/vign_test/spacemodR",     skip = TRUE, ser_elibs = "/home/runner/work/_temp/tmp/RtmpBkLAKt/file111773014081.rds")
     An irrecoverable exception occurred. R is aborting now ...
     Segmentation fault (core dumped)
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
      16.         └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )") at igraph/R/structural-properties.R:3771:5
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

