# acledR (1.0.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "acledR")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
        17.   └─httr2:::req_perform1(...)
        18.     └─httr2:::handle_preflight(req_prep, handle)
        19.       └─httr2:::auth_sign(req)
        20.         ├─rlang::exec(...)
        21.         └─httr2 (local) `<fn>`(...)
        22.           └─httr2:::auth_oauth_token_get(...)
        23.             ├─rlang::exec(flow, !!!flow_params)
        24.             └─httr2::oauth_flow_password(...)
        25.               └─httr2:::oauth_client_get_token(...)
        26.                 └─httr2:::oauth_flow_fetch(req, "client$token_url", error_call = error_call)
        27.                   └─httr2:::oauth_flow_parse(resp, source, error_call = error_call)
        28.                     └─httr2:::oauth_flow_abort(...)
        29.                       └─cli::cli_abort(...)
        30.                         └─rlang::abort(...)
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
        16. └─httr2::req_perform(.)
        17.   └─httr2:::req_perform1(...)
        18.     └─httr2:::handle_preflight(req_prep, handle)
        19.       └─httr2:::auth_sign(req)
        20.         ├─rlang::exec(...)
        21.         └─httr2 (local) `<fn>`(...)
        22.           └─httr2:::auth_oauth_token_get(...)
        23.             ├─rlang::exec(flow, !!!flow_params)
        24.             └─httr2::oauth_flow_password(...)
        25.               └─httr2:::oauth_client_get_token(...)
        26.                 └─httr2:::oauth_flow_fetch(req, "client$token_url", error_call = error_call)
        27.                   └─httr2:::oauth_flow_parse(resp, source, error_call = error_call)
        28.                     └─cli::cli_abort(...)
        29.                       └─rlang::abort(...)
       Execution halted
     ```

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘lifecycle’
       All declared Imports should be used.
     ```

# archeofrag (1.2.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "archeofrag")` for more info

## Newly broken

*   checking tests ... [26s/26s] ERROR
     ```
       Running ‘testthat.R’ [26s/26s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       The planarity of the graph value is indeterminated, simulations are executed with no planar constraint.
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 84 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-frag.edges.weighting.R:43:3'): weighting with morphometric and spatial parameters ──
       Expected `sum(igraph::E(g)$weight)` to equal 64.95129.
       Differences:
         `actual`: 65.014
       `expected`: 64.951
       
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 84 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘archeofrag-vignette.Rmd’ using rmarkdown
     
     Quitting from archeofrag-vignette.Rmd:238-253 [simulator-test]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `if (planar == TRUE & (!requireNamespace("RBGL", quietly = TRUE))) ...`:
     ! missing value where TRUE/FALSE needed
     ---
     Backtrace:
         ▆
      1. └─archeofrag::frag.simul.process(...)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'archeofrag-vignette.Rmd' failed with diagnostics:
     missing value where TRUE/FALSE needed
     --- failed re-building ‘archeofrag-vignette.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘archeofrag-vignette.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# bases (0.2.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "bases")` for more info

## Newly broken

*   checking tests ... [45s/25s] ERROR
     ```
       Running ‘testthat.R’ [45s/25s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       [12] 203.5709 - 203.5493 [12]
       [13] 203.0532 - 203.0455 [13]
       [14] 204.1923 - 204.0906 [14]
       [15] 203.9347 - 203.8869 [15]
       [16] 204.3967 - 204.4374 [16]
       [17] 207.5624 - 207.6712 [17]
       [18] 210.3805 - 210.3423 [18]
       [19] 209.9529 - 209.9692 [19]
       [20] 211.8444 - 212.0537 [20]
       
       
       [ FAIL 1 | WARN 0 | SKIP 1 | PASS 179 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# BASiNETEntropy (0.99.6)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "BASiNETEntropy")` for more info

## Newly broken

*   checking package dependencies ... ERROR
     ```
     Package required but not available: ‘Biostrings’
     
     See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
     manual.
     ```

# BeeBDC (1.3.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "BeeBDC")` for more info

## Newly broken

*   checking tests ... [35s/40s] ERROR
     ```
       Running ‘testthat.R’ [34s/40s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
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

# bio3d (2.4-5)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "bio3d")` for more info

## Newly broken

*   checking tests ... [216s/178s] ERROR
     ```
       Running ‘testthat.R’ [216s/177s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       ── Failure ('test-pdb.annotate.R:84:3'): PDB annotation works ──────────────────
       Expected `anno[1, "ligandId"]` to be identical to "NAG".
       Differences:
       1/1 mismatches
       x[1]: NA
       y[1]: "NAG"
       
       [ FAIL 3 | WARN 0 | SKIP 6 | PASS 432 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [61s/97s]
      [62s/97s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       ── Failure ('test-pdb.annotate.R:84:3'): PDB annotation works ──────────────────
       Expected `anno[1, "ligandId"]` to be identical to "NAG".
       Differences:
       1/1 mismatches
       x[1]: NA
       y[1]: "NAG"
       
       [ FAIL 3 | WARN 0 | SKIP 6 | PASS 432 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# bnstruct (1.0.15)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "bnstruct")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
           ▆
        1. ├─bnstruct::em(inf.engine, dataset) at test_em.R:8:1
        2. └─bnstruct::em(inf.engine, dataset)
        3.   ├─bnstruct::belief.propagation(eng)
        4.   └─bnstruct::belief.propagation(eng)
       ── Error ('test_em_contdata.R:6:1'): (code run outside of `test_that()`) ───────
       Error in `read.table(contdatafile, header = FALSE, sep = "\t")`: no lines available in input
       Backtrace:
           ▆
        1. └─utils::read.table(contdatafile, header = FALSE, sep = "\t") at test_em_contdata.R:6:1
       
       [ FAIL 2 | WARN 6 | SKIP 0 | PASS 1 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
           ▆
        1. └─utils::read.table(contdatafile, header = FALSE, sep = "\t") at test_em_contdata.R:6:1
        2.   └─base::file(file, "rt")
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_em_contdata.R:6:1'): (code run outside of `test_that()`) ───────
       Error in `read.table(contdatafile, header = FALSE, sep = "\t")`: no lines available in input
       Backtrace:
           ▆
        1. └─utils::read.table(contdatafile, header = FALSE, sep = "\t") at test_em_contdata.R:6:1
       
       [ FAIL 1 | WARN 4 | SKIP 0 | PASS 3 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘bnstruct.Rnw’ using Sweave
     Error: processing vignette 'bnstruct.Rnw' failed with diagnostics:
     Running 'texi2dvi' on 'bnstruct.tex' failed.
     LaTeX errors:
     ! LaTeX Error: File `pdfpages.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.6 ^^M
            
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘bnstruct.Rnw’
     
     SUMMARY: processing the following file failed:
       ‘bnstruct.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# bootcluster (0.4.3)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "bootcluster")` for more info

## Newly broken

*   checking examples with --run-donttest ... [153s/132s] ERROR
     ```
     ...
     ℹ Please use `induced_subgraph()` instead.
     ℹ The deprecated feature was likely used in the bootcluster package.
       Please report the issue to the authors.
     Warning: `fastgreedy.community()` was deprecated in igraph 2.0.0.
     ℹ Please use `cluster_fast_greedy()` instead.
     ℹ The deprecated feature was likely used in the bootcluster package.
       Please report the issue to the authors.
     Error:
     ! The `method` argument of `sample_degseq()` must be fast.heur.simple
       instead of simple.no.multiple as of igraph 2.1.0.
     Backtrace:
         ▆
      1. └─bootcluster::network.stability(...)
      2.   └─bootcluster:::scheme2.exp(...)
      3.     └─igraph::sample_degseq(out.deg = degree.seq, method = "simple.no.multiple")
      4.       └─lifecycle::deprecate_stop("2.1.0", "sample_degseq(method = 'must be fast.heur.simple instead of simple.no.multiple')") at igraph/R/games.R:1703:5
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     Examples with CPU (user + system) or elapsed time > 5s
                                           user system elapsed
     k.select_ref                        88.115  0.130  88.243
     ensemble.cluster.multi              27.374  0.024  14.729
     ensemble_cluster_multi_combinations 18.041  0.074   9.600
     k.select                            10.470  0.008  10.478
     ```

# btergm (1.11.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "btergm")` for more info

## Newly broken

*   checking tests ... [236s/232s] ERROR
     ```
       Running ‘testthat.R’ [236s/232s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       
       Saving _problems/test-gof-143.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 415 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-gof.R:143:3'): gof statistics for vectors work ───────────────
       Expected `sum(s)` to equal 442.
       Differences:
       1/1 mismatches
       [1] -1.37e+31 - 442 == -1.37e+31
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 415 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [219s/215s]
      [219s/215s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       
       Saving _problems/test-gof-143.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 415 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-gof.R:143:3'): gof statistics for vectors work ───────────────
       Expected `sum(s)` to equal 442.
       Differences:
       1/1 mismatches
       [1] 9.17e+299 - 442 == 9.17e+299
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 415 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# CePa (0.8.2)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "CePa")` for more info

## Newly broken

*   checking re-building of vignette outputs ... WARNING
     ```
     ...
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘analysis-p53.Rnw’
     
     --- re-building ‘parsing-PID-pathway-data.Rnw’ using Sweave
     Error: processing vignette 'parsing-PID-pathway-data.Rnw' failed with diagnostics:
     Running 'texi2dvi' on 'parsing-PID-pathway-data.tex' failed.
     LaTeX errors:
     ! LaTeX Error: File `grfext.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.179   \RequirePackage{grfext}\relax
                                          ^^M
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘parsing-PID-pathway-data.Rnw’
     
     SUMMARY: processing the following files failed:
       ‘CePa.Rnw’ ‘analysis-p53.Rnw’ ‘parsing-PID-pathway-data.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## Newly fixed

*   checking package dependencies ... ERROR
     ```
     Package required but not available: ‘Rgraphviz’
     
     See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
     manual.
     ```

# cfid (0.1.8)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "cfid")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       
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

# checked (0.5.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "checked")` for more info

## Newly broken

*   checking tests ... [773s/421s] ERROR
     ```
       Running ‘testthat.R’ [773s/420s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       + Message
       +   [][check] rev.both.error finished with 1 ERROR, 1 WARNING [7/7] ()
       +   Finished in 
       
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 1 | WARN 315 | SKIP 0 | PASS 171 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# cito (1.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "cito")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,24c6
     < Potential spelling errors:
     <   WORD             FOUND IN
     < DHARMa           A-Introduction_to_cito.Rmd:506
     < JSDM             C-Example_Species_distribution_modeling.Rmd:802,804
     < JSDMs            C-Example_Species_distribution_modeling.Rmd:802,804,828
     < Warton           C-Example_Species_distribution_modeling.Rmd:802
     < biotic           C-Example_Species_distribution_modeling.Rmd:802,818
     < continuoues      A-Introduction_to_cito.Rmd:124
     < disperson        A-Introduction_to_cito.Rmd:577
     < glmmTMB          A-Introduction_to_cito.Rmd:549
     < metacommunity    C-Example_Species_distribution_modeling.Rmd:804
     < modelled         C-Example_Species_distribution_modeling.Rmd:414
     < nbinom           dnn.Rd:127
     <                  A-Introduction_to_cito.Rmd:549
     < poisson          dnn.Rd:126
     <                  A-Introduction_to_cito.Rmd:490,497,549
     < reguarlization   NEWS.md:37
     < sjSDM            C-Example_Species_distribution_modeling.Rmd:804,828
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# comato (1.1)

* : <UNKNOWN>

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

# conos (1.5.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "conos")` for more info

## Newly broken

*   checking package dependencies ... ERROR
     ```
     Package required but not available: ‘ComplexHeatmap’
     
     Packages suggested but not available for checking:
       'AnnotationDbi', 'conosPanel', 'DESeq2', 'GO.db', 'org.Hs.eg.db',
       'org.Mm.eg.db', 'p2data', 'rhdf5'
     
     See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
     manual.
     ```

# corHMM (2.8)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "corHMM")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
           ▆
        1. └─corHMM::corHMM(...) at testlikelihood.R:157:3
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('testlikelihood.R:137:3'): Simple tests of corDISC vs. new corHMM ──
       Expected `comparison` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 1 | WARN 7 | SKIP 0 | PASS 6 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
           ▆
        1. └─corHMM::corHMM(...) at testlikelihood.R:157:3
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('testlikelihood.R:137:3'): Simple tests of corDISC vs. new corHMM ──
       Expected `comparison` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 1 | WARN 7 | SKIP 0 | PASS 6 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# corTest (1.0.7)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "corTest")` for more info

## Newly broken

*   checking package dependencies ... ERROR
     ```
     Package required but not available: ‘Biobase’
     
     See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
     manual.
     ```

## Newly fixed

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘graphics’
       All declared Imports should be used.
     ```

# covtracer (0.0.3)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "covtracer")` for more info

## Newly broken

*   checking tests ... [26s/18s] ERROR
     ```
       Running ‘testthat.R’ [26s/18s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
        14. │                       ├─base::assign(paste0(pkg, "_ns"), getNamespace(pkg)) at ./setup_test_packages.R:53:5
        15. │                       └─base::getNamespace(pkg)
        16. │                         ├─.Internal(getRegisteredNamespace(name)) %||% ...
        17. │                         └─base::loadNamespace(name)
        18. │                           ├─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
        19. │                           │ └─base (local) withOneRestart(expr, restarts[[1L]])
        20. │                           │   └─base (local) doWithOneRestart(return(expr), restart)
        21. │                           └─base::stop(cond)
        22. └─testthat (local) `<fn>`(`<pckgNtFE>`)
        23.   └─cli::cli_abort(...)
        24.     └─rlang::abort(...)
       Warning message:
       In install.packages(as.character(pkg_dirs), type = "source", lib = lib,  :
         installation of package '/home/runner/work/_temp/revdep2-work/check/covtracer/new/covtracer.Rcheck/tests/testthat/packages/reexport.srcref' had non-zero exit status
       Execution halted
     ```

# craftgrn (0.1.7)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "craftgrn")` for more info

## Newly broken

*   checking tests ... [23s/22s] NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,9c6
     < Potential spelling errors:
     <   WORD  FOUND IN
     < Ng   description:8
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’ [21s/21s]
     ```

# cranly (0.6.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "cranly")` for more info

## Newly broken

*   checking examples with --run-donttest ... [11m/11m] ERROR
     ```
     ...
     > cran_db <- clean_CRAN_db()
     > package_network <- build_network(cran_db)
     > 
     > package_summaries <- summary(package_network)
     Error:
     ! The `scale` argument of `eigen_centrality()` always as if TRUE as of
       igraph 2.1.1.
     ℹ Normalization is always performed
     Backtrace:
         ▆
      1. ├─base::summary(package_network)
      2. └─cranly:::summary.cranly_network(package_network)
      3.   └─igraph::eigen_centrality(cranly_graph, scale = FALSE)
      4.     └─lifecycle::deprecate_stop(...) at igraph/R/centrality.R:1493:7
      5.       └─lifecycle:::deprecate_stop0(msg)
      6.         └─rlang::cnd_signal(...)
     Execution halted
     Examples with CPU (user + system) or elapsed time > 5s
                                             user system elapsed
     as.igraph.cranly_network             207.600  0.528 209.323
     plot.cranly_network                  108.549  0.097 109.921
     build_network.cranly_db              104.572  0.042 105.853
     extractor-functions                   98.718  0.015  99.968
     build_dependence_tree.cranly_network  41.466  0.082  42.695
     clean_CRAN_db                         39.071  0.009  40.207
     ```

*   checking re-building of vignette outputs ... [28s/28s] ERROR
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

# dartR (2.9.9.5)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "dartR")` for more info

## Newly broken

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘foreach’
       All declared Imports should be used.
     ```

## Newly fixed

*   checking package dependencies ... ERROR
     ```
     Package required but not available: ‘SNPRelate’
     
     Packages suggested but not available for checking: 'qvalue', 'snpStats'
     
     See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
     manual.
     ```

# dci (1.0.3)

* : <UNKNOWN>

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
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
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
       
       [ FAIL 3 | WARN 0 | SKIP 1 | PASS 47 ]
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

# debkeepr (0.1.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "debkeepr")` for more info

## Newly broken

*   checking tests ... [20s/20s] ERROR
     ```
       Running ‘testthat.R’ [19s/19s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       -   x Cannot combine: `..2` <deb_tetra> vector with `bases` s = 50, d = 16, and f = 8.
       +   x Cannot combine: `y` <deb_tetra> vector with `bases` s = 50, d = 16, and f = 8.
           i Use `deb_convert_bases()` to convert one or more of the vectors to compatible `bases`.
       
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 11 | WARN 1 | SKIP 0 | PASS 1082 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [20s/20s]
      [20s/20s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       -   x Cannot combine: `..2` <deb_tetra> vector with `bases` s = 50, d = 16, and f = 8.
       +   x Cannot combine: `y` <deb_tetra> vector with `bases` s = 50, d = 16, and f = 8.
           i Use `deb_convert_bases()` to convert one or more of the vectors to compatible `bases`.
       
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 11 | WARN 1 | SKIP 0 | PASS 1082 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# deepdep (0.4.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "deepdep")` for more info

## Newly broken

*   checking tests ... [39s/47s] NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     5,8c5
     < Potential spelling errors:
     <   WORD  FOUND IN
     < vcr   NEWS.md:2
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’ [38s/47s]
     ```

# degreenet (1.3-7)

* : <UNKNOWN>

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

# dm (1.1.2)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "dm")` for more info

## Newly broken

*   checking tests ... [100s/118s] ERROR
     ```
       Running ‘testthat.R’ [99s/118s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 1 | WARN 13 | SKIP 43 | PASS 2365 ]
       Error:
       ! Test failures.
       Warning messages:
       1: call dbDisconnect() when finished working with a connection 
       2: call dbDisconnect() when finished working with a connection 
       Execution halted
       Warning message:
       call dbDisconnect() when finished working with a connection 
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [88s/98s]
      [88s/98s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 1 | WARN 13 | SKIP 43 | PASS 2365 ]
       Error:
       ! Test failures.
       Warning messages:
       1: call dbDisconnect() when finished working with a connection 
       2: call dbDisconnect() when finished working with a connection 
       Execution halted
       Warning message:
       call dbDisconnect() when finished working with a connection 
     ```

# easynem (1.0.3)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "easynem")` for more info

## Newly broken

*   checking tests ... [11s/11s] NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,10c6
     < Potential spelling errors:
     <   WORD      FOUND IN
     < ejsobi    description:8
     < soilbio   description:9
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# ECoL (0.4.4)

* : <UNKNOWN>

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
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
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

# EcoNetGen (0.2.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "EcoNetGen")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     5,9c5
     < Potential spelling errors:
     <   WORD  FOUND IN
     < BDR   NEWS.md:3
     < LTO   NEWS.md:11
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# epicontacts (1.1.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "epicontacts")` for more info

## Newly broken

*   checking tests ... [62s/62s] ERROR
     ```
       Running ‘testthat.R’ [62s/62s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         1. ├─testthat::expect_warning(net <- as.igraph.epicontacts(x), "NA") at test_as.igraph.epicontacts.R:34:3
         2. │ └─testthat:::quasi_capture(...)
         3. │   ├─testthat (local) .capture(...)
         4. │   │ └─base::withCallingHandlers(...)
         5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         6. └─epicontacts:::as.igraph.epicontacts(x)
         7.   └─igraph::graph_from_data_frame(x$contacts, vertices = verts, directed = x$directed)
         8.     └─igraph:::ensure_no_na(d[, 1:2], "edge data frame") at igraph/R/conversion.R:2001:3
         9.       └─cli::cli_abort(...) at igraph/R/utils-assert-args.R:82:5
        10.         └─rlang::abort(...)
       
       [ FAIL 1 | WARN 1 | SKIP 0 | PASS 154 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [65s/65s]
      [66s/65s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         1. ├─testthat::expect_warning(net <- as.igraph.epicontacts(x), "NA") at test_as.igraph.epicontacts.R:34:3
         2. │ └─testthat:::quasi_capture(...)
         3. │   ├─testthat (local) .capture(...)
         4. │   │ └─base::withCallingHandlers(...)
         5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         6. └─epicontacts:::as.igraph.epicontacts(x)
         7.   └─igraph::graph_from_data_frame(x$contacts, vertices = verts, directed = x$directed)
         8.     └─igraph:::ensure_no_na(d[, 1:2], "edge data frame")
         9.       └─cli::cli_abort(...)
        10.         └─rlang::abort(...)
       
       [ FAIL 1 | WARN 1 | SKIP 0 | PASS 154 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# fairadapt (1.0.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "fairadapt")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ... OK
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
           Total variation (before adaptation): -0.0153
       -   Total variation (after adaptation):  -0.07085
       +   Total variation (after adaptation):  -0.05233
       
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 1 | WARN 0 | SKIP 5 | PASS 57 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ... OK
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
           Total variation (before adaptation): -0.0153
       -   Total variation (after adaptation):  -0.07085
       +   Total variation (after adaptation):  -0.05233
       
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 1 | WARN 0 | SKIP 5 | PASS 57 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# FedData (4.3.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "FedData")` for more info

## Newly broken

*   checking tests ... [5s/18s] ERROR
     ```
       Running ‘testthat.R’ [5s/17s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test.NLCD.R:68:5'): The NLCD provides the same data as a raw download ──
       Error: [rast] file does not exist: /home/runner/work/_temp/tmp/RtmpjCFl1k/working_dir/Rtmph2LUWB/file1d0a156f51510/pr_landcover_wimperv_10-28-08_se5.img
       Backtrace:
           ▆
        1. ├─terra::rast(file.path(raw_tmp, "pr_landcover_wimperv_10-28-08_se5.img")) at test.NLCD.R:68:5
        2. └─terra::rast(file.path(raw_tmp, "pr_landcover_wimperv_10-28-08_se5.img"))
        3.   └─terra (local) .local(x, ...)
        4.     └─terra:::messages(r, "rast")
        5.       └─terra:::error(f, x@pntr$getError())
       
       [ FAIL 1 | WARN 2 | SKIP 1 | PASS 17 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [5s/17s]
      [5s/17s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test.NLCD.R:68:5'): The NLCD provides the same data as a raw download ──
       Error: [rast] file does not exist: /home/runner/work/_temp/tmp/RtmpRGjicn/working_dir/RtmppX4WK0/file1a0e5f07d788/pr_landcover_wimperv_10-28-08_se5.img
       Backtrace:
           ▆
        1. ├─terra::rast(file.path(raw_tmp, "pr_landcover_wimperv_10-28-08_se5.img")) at test.NLCD.R:68:5
        2. └─terra::rast(file.path(raw_tmp, "pr_landcover_wimperv_10-28-08_se5.img"))
        3.   └─terra (local) .local(x, ...)
        4.     └─terra:::messages(r, "rast")
        5.       └─terra:::error(f, x@pntr$getError())
       
       [ FAIL 1 | WARN 2 | SKIP 1 | PASS 17 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# frscore (0.5.2)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "frscore")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,23c6
     < Potential spelling errors:
     <   WORD           FOUND IN
     < CMD            README.md:3
     < Pekka          frscore-package.Rd:11
     < Veli           frscore-package.Rd:11
     < adjacencies    submodel_adjacencies_to_igraph.Rd:5,16
     <                NEWS.md:33
     < betweenness    plot_submodel_network.Rd:49,52
     < disjunction    causal_submodel.Rd:164
     < disjunctions   causal_submodel.Rd:165
     < disjuncts      causal_submodel.Rd:115
     < igraph         plot_submodel_network.Rd:23
     <                submodel_adjacencies_to_igraph.Rd:5,16
     < maxsols        NEWS.md:87
     < mscs           frscored_cna.Rd:32,34
     <                rean_cna.Rd:19,21
     <                NEWS.md:38
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# fsbrain (0.6.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "fsbrain")` for more info

## Newly broken

*   checking tests ... [149s/415s] ERROR
     ```
       Running ‘testthat_au.R’ [130s/387s]
       Running ‘testthat_vz.R’ [18s/28s]
     Running the tests in ‘tests/testthat_au.R’ failed.
     Last 13 lines of output:
       Backtrace:
           ▆
        1. └─fsbrain::export(...) at test-issue50.R:35:5
        2.   └─fsbrain::vis.export.from.coloredmeshes(...)
        3.     └─fsbrain::vislayout.from.coloredmeshes(...)
        4.       └─fsbrain::arrange.brainview.images(...)
        5.         └─magick::image_trim(images)
        6.           └─magick:::magick_image_trim(image, fuzz)
       ── Failure ('test-metadata_io.R:30:3'): Demographics reports can be generated. ──
       Expected `report_unpaired <- report.on.demographics(demographics, group_column_name = "group")` to produce warnings.
       
       [ FAIL 4 | WARN 22 | SKIP 14 | PASS 661 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat_au.R’ [136s/332s]
       Running ‘testthat_vz.R’ [19s/28s]
      [156s/360s] ERROR
     Running the tests in ‘tests/testthat_au.R’ failed.
     Last 13 lines of output:
       Backtrace:
           ▆
        1. └─fsbrain::export(...) at test-issue50.R:35:5
        2.   └─fsbrain::vis.export.from.coloredmeshes(...)
        3.     └─fsbrain::vislayout.from.coloredmeshes(...)
        4.       └─fsbrain::arrange.brainview.images(...)
        5.         └─magick::image_trim(images)
        6.           └─magick:::magick_image_trim(image, fuzz)
       ── Failure ('test-metadata_io.R:30:3'): Demographics reports can be generated. ──
       Expected `report_unpaired <- report.on.demographics(demographics, group_column_name = "group")` to produce warnings.
       
       [ FAIL 4 | WARN 21 | SKIP 14 | PASS 661 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# gemtc (1.1-1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "gemtc")` for more info

## Newly broken

*   checking tests ... [14s/14s] ERROR
     ```
       Running ‘test.R’ [14s/14s]
     Running the tests in ‘tests/test.R’ failed.
     Last 13 lines of output:
       Expected `x` to be equivalent to `expected`.
       3/7 mismatches (average diff: 1.33)
       [3]  0 - -1 ==  1
       [5]  1 -  0 ==  1
       [6] -1 -  1 == -2
       Backtrace:
           ▆
        1. └─testthat::expect_that(...) at test-unit-relative.effect.R:65:3
        2.   └─testthat (local) condition(object)
        3.     └─testthat::expect_equivalent(x, expected, expected.label = label)
       
       [ FAIL 1 | WARN 11 | SKIP 0 | PASS 377 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# GGally (2.4.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "GGally")` for more info

## Newly broken

*   checking tests ... [94s/92s] ERROR
     ```
     ...
     < > 
     < > # only check spelling if on CI and spelling is available
     < > if (requireNamespace("spelling", quietly = TRUE)) {
     ---
     > + 
     > + # only check spelling if on CI and spelling is available
     > + if (requireNamespace("spelling", quietly = TRUE)) {
       Running ‘testthat.R’ [91s/90s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
        1. └─GGally:::ggally_expect_doppelganger("nested-strips-true", pm) at test-zzz_ggpairs.R:700:3
        2.   └─vdiffr::expect_doppelganger(name, plot) at ./helper-doppelganger.R:15:5
        3.     ├─base::withCallingHandlers(...)
        4.     └─testthat::expect_snapshot_file(...)
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 133 | WARN 1 | SKIP 1 | PASS 921 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
     ...
     < > # only check spelling if on CI and spelling is available
     < > if (requireNamespace("spelling", quietly = TRUE)) {
     ---
     > + 
     > + # only check spelling if on CI and spelling is available
     > + if (requireNamespace("spelling", quietly = TRUE)) {
       Running ‘testthat.R’ [88s/86s]
      [90s/88s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
        1. └─GGally:::ggally_expect_doppelganger("nested-strips-true", pm) at test-zzz_ggpairs.R:700:3
        2.   └─vdiffr::expect_doppelganger(name, plot) at ./helper-doppelganger.R:15:5
        3.     ├─base::withCallingHandlers(...)
        4.     └─testthat::expect_snapshot_file(...)
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 133 | WARN 1 | SKIP 1 | PASS 921 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# ggm (2.5.4)

* : <UNKNOWN>

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

# ggokabeito (0.1.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "ggokabeito")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 1 | WARN 5 | SKIP 1 | PASS 10 ]
       Error:
       ! Test failures.
       Execution halted
     Running the tests in ‘tests/vdiffr.[rR]’ failed.
     Last 13 lines of output:
       : 1.07; stroke: #D55E00; stroke-linecap: butt; fill: #D55E00; fill-opacity: 0.90
       : ;' />                                                                         
         <rect x='644.30' y='334.81' width='17.28' height='17.28' style='stroke-width: 
         1.07; stroke: none; fill: #FFFFFF;' />                                        
       < <rect x='645.01' y='335.52' width='15.86' height='15.86' style='stroke-width: 
       : 1.07; stroke: #CC79A7; stroke-linecap: square; stroke-linejoin: miter; fill: #
       : CC79A7; fill-opacity: 0.90;' />                                               
       > <rect x='645.01' y='335.52' width='15.86' height='15.86' style='stroke-width: 
       : 1.07; stroke: #CC79A7; stroke-linecap: butt; fill: #CC79A7; fill-opacity: 0.90
       : ;' />                                                                         
         <text x='667.06' y='242.80' style='font-size: 8.80px; font-family: sans;' text
         Length='29.36px' lengthAdjust='spacingAndGlyphs'>2seater</text>               
         <text x='667.06' y='260.08' style='font-size: 8.80px; font-family: sans;' text
         Length='33.27px' lengthAdjust='spacingAndGlyphs'>compact</text>               
       
     ```

## Newly fixed

*   checking tests ...
     ```
     ...
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 1 | WARN 5 | SKIP 1 | PASS 10 ]
       Error:
       ! Test failures.
       Execution halted
     Running the tests in ‘tests/vdiffr.[rR]’ failed.
     Last 13 lines of output:
       : 1.07; stroke: #D55E00; stroke-linecap: butt; fill: #D55E00; fill-opacity: 0.90
       : ;' />                                                                         
         <rect x='644.30' y='334.81' width='17.28' height='17.28' style='stroke-width: 
         1.07; stroke: none; fill: #FFFFFF;' />                                        
       < <rect x='645.01' y='335.52' width='15.86' height='15.86' style='stroke-width: 
       : 1.07; stroke: #CC79A7; stroke-linecap: square; stroke-linejoin: miter; fill: #
       : CC79A7; fill-opacity: 0.90;' />                                               
       > <rect x='645.01' y='335.52' width='15.86' height='15.86' style='stroke-width: 
       : 1.07; stroke: #CC79A7; stroke-linecap: butt; fill: #CC79A7; fill-opacity: 0.90
       : ;' />                                                                         
         <text x='667.06' y='242.80' style='font-size: 8.80px; font-family: sans;' text
         Length='29.36px' lengthAdjust='spacingAndGlyphs'>2seater</text>               
         <text x='667.06' y='260.08' style='font-size: 8.80px; font-family: sans;' text
         Length='33.27px' lengthAdjust='spacingAndGlyphs'>compact</text>               
       
     ```

# ggraph (2.2.2)

* : <UNKNOWN>

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

*   checking re-building of vignette outputs ... [22s/20s] ERROR
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

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "glyrepr")` for more info

## Newly broken

*   checking tests ... [20s/20s] ERROR
     ```
       Running ‘testthat.R’ [20s/20s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       > test_check("glyrepr")
       Saving _problems/test-structure-to-iupac-95.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1322 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-structure-to-iupac.R:95:3'): structure_to_iupac handles complex branched structures ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(valid_graphs, function(graph) {     checkmate::assert_class(graph, "igraph")     graph %>% validate_glycan_graph() %>% canonicalize_glycan_graph() })`: i In index: 1.
       Caused by error in `validate_glycan_graph()`:
       ! Duplicated linkage positions.
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1322 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# GoodFitSBM (0.0.1)

* : <UNKNOWN>

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

# HospitalNetwork (0.9.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "HospitalNetwork")` for more info

## Newly broken

*   checking tests ... [11s/10s] ERROR
     ```
     ...
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 3 | WARN 0 | SKIP 0 | PASS 62 ]
       Error:
       ! Test failures.
       Execution halted
     Running the tests in ‘tests/vdiffr.[rR]’ failed.
     Last 13 lines of output:
         Length='4.89px' lengthAdjust='spacingAndGlyphs'>1</text>                      
       
       
       Failed doppelganger: circclust500 (/home/runner/work/_temp/revdep2-work/check/HospitalNetwork/new/HospitalNetwork.Rcheck/tests/testthat/_snaps/HospiNet/circclust500.svg)
       
       < before                                                                        
       > after                                                                         
       @@ 19,4 / 19,5 @@                                                               
         </defs>                                                                       
         <g clip-path='url(#cpMC4wMHw3MjAuMDB8MC4wMHw1NzYuMDA=)'>                      
       > <rect x='0.00' y='0.00' width='720.00' height='576.00' style='stroke-width: 0.
       : 00; stroke: none;' />                                                         
         </g>                                                                          
         <defs>                                                                        
       
     ```

## Newly fixed

*   checking tests ...
     ```
     ...
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 3 | WARN 0 | SKIP 0 | PASS 62 ]
       Error:
       ! Test failures.
       Execution halted
     Running the tests in ‘tests/vdiffr.[rR]’ failed.
     Last 13 lines of output:
         Length='4.89px' lengthAdjust='spacingAndGlyphs'>1</text>                      
       
       
       Failed doppelganger: circclust500 (/home/runner/work/_temp/revdep2-work/check/HospitalNetwork/old/HospitalNetwork.Rcheck/tests/testthat/_snaps/HospiNet/circclust500.svg)
       
       < before                                                                        
       > after                                                                         
       @@ 19,4 / 19,5 @@                                                               
         </defs>                                                                       
         <g clip-path='url(#cpMC4wMHw3MjAuMDB8MC4wMHw1NzYuMDA=)'>                      
       > <rect x='0.00' y='0.00' width='720.00' height='576.00' style='stroke-width: 0.
       : 00; stroke: none;' />                                                         
         </g>                                                                          
         <defs>                                                                        
       
     ```

# HyperG (1.0.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "HyperG")` for more info

## Newly broken

*   checking tests ... [15s/15s] ERROR
     ```
       Running ‘testthat.R’ [15s/15s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       ── Failure ('test_line.graph.R:27:3'): line.graph works ────────────────────────
       Expected `isomorphic(g4, g5)` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 4 | WARN 55 | SKIP 0 | PASS 231 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [12s/12s]
      [13s/12s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       ── Failure ('test_line.graph.R:27:3'): line.graph works ────────────────────────
       Expected `isomorphic(g4, g5)` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 4 | WARN 55 | SKIP 0 | PASS 231 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# ivgls (0.1.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "ivgls")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,21c6
     < Potential spelling errors:
     <   WORD               FOUND IN
     < ADNI               ivgls-intro.Rmd:209
     < DKT                ivgls-intro.Rmd:209
     < MMSE               ivgls-intro.Rmd:209
     < Neuroimaging       ivgls-intro.Rmd:209
     < ROIs               ivgls-intro.Rmd:209
     < doi                description:7
     < glmgraph           description:7
     < mathbb             ivgls-intro.Rmd:89
     < misspecification   ivgls-intro.Rmd:162
     < neuroimaging       ivgls-intro.Rmd:209
     < pleiotropic        ivgls-intro.Rmd:209
     < pleiotropy         ivgls-intro.Rmd:26
     < subcortical        ivgls-intro.Rmd:209
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# kuzuR (0.2.3)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "kuzuR")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,9c6
     < Potential spelling errors:
     <   WORD     FOUND IN
     < kuzu's   description:9
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

## In both

*   checking examples with --run-donttest ... ERROR
     ```
     Running examples in ‘kuzuR-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: as.data.frame.kuzu.query_result.QueryResult
     > ### Title: Convert a Kuzu Query Result to a Data Frame
     > ### Aliases: as.data.frame.kuzu.query_result.QueryResult
     > 
     > ### ** Examples
     > 
     > ## No test: 
     > conn <- kuzu_connection(":memory:")
     Downloading uv...Done!
     Downloading numpy (15.9MiB)
      Downloaded numpy
     Installed 1 package in 18ms
     Error in py_run_string_impl(code, local, convert) : 
       ModuleNotFoundError: No module named 'kuzu'
     Run `reticulate::py_last_error()` for details.
     Calls: kuzu_connection -> <Anonymous> -> py_run_string_impl
     Execution halted
     ```

# lava (1.9.2)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "lava")` for more info

## Newly broken

*   checking tests ... [35s/34s] ERROR
     ```
       Running ‘test-all.R’ [35s/34s]
     Running the tests in ‘tests/test-all.R’ failed.
     Last 13 lines of output:
       Backtrace:
           ▆
        1. ├─base::plot(lava:::beautify(m), noplot = TRUE) at test-graphics.R:157:3
        2. └─lava:::plot.lvm(lava:::beautify(m), noplot = TRUE)
        3.   ├─lava::finalize(...)
        4.   └─lava:::finalize.lvm(...)
        5.     ├─methods::as(new("graphAM", adjMat = x$M, "directed"), "graphNEL")
        6.     │ └─methods:::.class1(object)
        7.     └─methods::new("graphAM", adjMat = x$M, "directed")
        8.       └─methods::getClass(Class, where = topenv(parent.frame()))
       
       [ FAIL 1 | WARN 33 | SKIP 1 | PASS 964 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# leiden (0.4.3.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "leiden")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,22c6
     < Potential spelling errors:
     <   WORD           FOUND IN
     < RBC            benchmarking.Rmd:174,351
     < Rmarkdown      NEWS.md:47
     < adjaceny       benchmarking.Rmd:551,890
     < behaviour      leiden.Rd:44
     < benchmarking   NEWS.md:37
     < cairo          NEWS.md:61
     < dgCMatrix      benchmarking.Rmd:462
     < efficent       benchmarking.Rmd:632
     < generalises    benchmarking.Rmd:174,351
     < modularity     leiden.Rd:40
     <                benchmarking.Rmd:174,351,763
     < mplex          run_multiplex.Rmd:36
     < paritions      benchmarking.Rmd:856
     < reticualte     benchmarking.Rmd:435
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# LSTbook (0.6)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "LSTbook")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       
       ── Failure ('test-pointplot.R:22:3'): NAs in color or faceting variables cause the corresponding row to be deleted. ──
       Snapshot of `suppressWarnings(gg_in_tmp_png(P))` has changed.
       
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 5 | WARN 1 | SKIP 0 | PASS 74 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       
       ── Failure ('test-pointplot.R:22:3'): NAs in color or faceting variables cause the corresponding row to be deleted. ──
       Snapshot of `suppressWarnings(gg_in_tmp_png(P))` has changed.
       
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 5 | WARN 1 | SKIP 0 | PASS 74 ]
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
         ‘add_plot_labels.Rd’ ‘datasim_helpers.R’ ‘datasim_make.Rd’
         ‘model_eval.R’ ‘model_eval.Rd’ ‘model_plot.R’ ‘model_skeleton.Rd’
         ‘model_values.R’ ‘model_values.Rd’ ‘mosaic_cull_for_do.Rd’ ‘ntiles.R’
         ‘ntiles.Rd’ ‘point_plot.R’ ‘point_plot.Rd’ ‘print.R’
         ‘random_terms.Rd’ ‘regression_summaries.Rd’ ‘sims.R’
         ‘statistical_annotations.Rd’ ‘trials.R’ ‘trials.Rd’ ‘zero_one.Rd’
     ```

# manureshed (0.1.5)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "manureshed")` for more info

## Newly broken

*   checking examples with --run-donttest ... ERROR
     ```
     Running examples in ‘manureshed-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: batch_analysis_parallel
     > ### Title: Batch Analysis with Parallel Processing
     > ### Aliases: batch_analysis_parallel
     > 
     > ### ** Examples
     > 
     > ## No test: 
     > results <- batch_analysis_parallel(
     +   years = 2015:2016,  # Use valid years only
     +   n_cores = 2,        # Max 2 cores for CRAN
     +   scale = "county",   # Use county for faster processing
     +   nutrients = "nitrogen"
     + )
     Starting parallel batch analysis with 2 cores
     Processing 2 years
     Error in serverSocket(port = port) : 
       creation of server socket failed: port 11402 cannot be opened
     Calls: batch_analysis_parallel -> <Anonymous> -> makePSOCKcluster -> serverSocket
     Execution halted
     ```

# ManyIVsNets (0.1.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "ManyIVsNets")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,12c6
     < Potential spelling errors:
     <   WORD          FOUND IN
     < CBO           description:9
     < PhysRevLett   description:8
     < csv           export_comprehensive_results.Rd:33
     < doi           description:7,8,9
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# manymome (0.3.6)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "manymome")` for more info

## Newly broken

*   checking tests ... [19m/10m] ERROR
     ```
       Running ‘testthat.R’ [19m/10m]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       [1] "chisq.scaled"  - "chisq"         [1]
       [2] "df"            | "df"            [2]
       [3] "pvalue.scaled" - "pvalue"        [3]
       [4] "cfi.robust"    - "cfi"           [4]
       [5] "rmsea.robust"  - "rmsea"         [5]
       [6] "srmr"          | "srmr"          [6]
       
         `actual`: 11.83540 2.00000 0.00269 0.43972 0.36077 0.15354
       `expected`: 50.12004 2.00000 0.00000 0.42684 0.38778 0.15354
       
       
       [ FAIL 9 | WARN 8 | SKIP 35 | PASS 1264 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [772s/391s]
      [772s/391s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       [1] "chisq.scaled"  - "chisq"         [1]
       [2] "df"            | "df"            [2]
       [3] "pvalue.scaled" - "pvalue"        [3]
       [4] "cfi.robust"    - "cfi"           [4]
       [5] "rmsea.robust"  - "rmsea"         [5]
       [6] "srmr"          | "srmr"          [6]
       
         `actual`: 11.83540 2.00000 0.00269 0.43972 0.36077 0.15354
       `expected`: 50.12004 2.00000 0.00000 0.42684 0.38778 0.15354
       
       
       [ FAIL 9 | WARN 8 | SKIP 35 | PASS 1264 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# manynet (2.2.3)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "manynet")` for more info

## Newly broken

*   checking tests ... [126s/66s] ERROR
     ```
       Running ‘testthat.R’ [125s/66s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       `expected` is NULL
       
       Warning in expression 46 : mean(as_matrix(s_women))
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_manynet.R:4:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─manynet:::check_tute_functions(tute)
        5.   └─testthat::expect_null(...) at ./helper-manynet.R:225:5
       
       [ FAIL 2 | WARN 644 | SKIP 77 | PASS 3313 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# metacoder (0.3.9)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "metacoder")` for more info

## Newly broken

*   checking tests ... [18s/61s] ERROR
     ```
       Running ‘testthat.R’ [18s/61s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       • metacoder:::primersearch_is_installed(must_be_installed = FALSE) is not TRUE
         (1): 'test--simulated_pcr.R:20:3'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test--parsers_and_writers.R:206:3'): Converting to phyloseq ─────────
       <packageNotFoundError/error/condition>
       Error in `library(phyloseq)`: there is no package called 'phyloseq'
       Backtrace:
           ▆
        1. └─base::library(phyloseq) at test--parsers_and_writers.R:206:3
       
       [ FAIL 1 | WARN 0 | SKIP 1 | PASS 554 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [14s/59s]
      [14s/59s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       • metacoder:::primersearch_is_installed(must_be_installed = FALSE) is not TRUE
         (1): 'test--simulated_pcr.R:20:3'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test--parsers_and_writers.R:206:3'): Converting to phyloseq ─────────
       <packageNotFoundError/error/condition>
       Error in `library(phyloseq)`: there is no package called 'phyloseq'
       Backtrace:
           ▆
        1. └─base::library(phyloseq) at test--parsers_and_writers.R:206:3
       
       [ FAIL 1 | WARN 0 | SKIP 1 | PASS 554 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking examples with --run-donttest ... [106s/151s] ERROR
     ```
     ...
     > ### Name: ncbi_taxon_sample
     > ### Title: Download representative sequences for a taxon
     > ### Aliases: ncbi_taxon_sample
     > 
     > ### ** Examples
     > 
     > ## No test: 
     > if (requireNamespace("traits", quietly = TRUE)) {
     +   # Look up 5 ITS sequences from each fungal class
     +   data <- ncbi_taxon_sample(name = "Fungi", target_rank = "class", limit = 5, 
     +                             entrez_query = '"internal transcribed spacer"[All Fields]')
     +   
     +   # Look up taxonomic information for sequences
     +   obj <- lookup_tax_data(data, type = "seq_id", column = "gi_no")
     +   
     +   # Plot information
     +   metacoder::filter_taxa(obj, taxon_names == "Fungi", subtaxa = TRUE) %>% 
     +     heat_tree(node_label = taxon_names, node_color = n_obs, node_size = n_obs)
     + }
     No ENTREZ API key provided
      Get one via taxize::use_entrez()
     See https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/
     ══  1 queries  ═══════════════
     
     Retrieving data for taxon 'Fungi'
     ```

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘R6’
       All declared Imports should be used.
     ```

# metainsight (7.1.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "metainsight")` for more info

## Newly broken

*   checking tests ... [29s/29s] ERROR
     ```
       Running ‘testthat.R’ [29s/29s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         5.         └─testthat:::test_files_setup_state(...)
         6.           └─testthat::source_test_helpers(".", env)
         7.             └─testthat::source_dir(path, "^helper.*\\.[rR]$", env = env, wrap = FALSE)
         8.               └─base::lapply(...)
         9.                 └─testthat (local) FUN(X[[i]], ...)
        10.                   └─testthat::source_file(...)
        11.                     ├─base::withCallingHandlers(...)
        12.                     └─base::eval(exprs, env)
        13.                       └─base::eval(exprs, env)
        14.                         └─app$upload_file(`setup_load-file1` = minimal_data_path) at ./helper-02-data.R:26:5
        15.                           └─shinytest2:::app_upload_file(...)
        16.                             └─shinytest2:::app_find_node_id(self, private, input = names(inputs)[1])
        17.                               └─shinytest2:::app_abort(...)
        18.                                 └─rlang::abort(..., app = self, call = call)
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [33s/32s]
      [34s/32s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         5.         └─testthat:::test_files_setup_state(...)
         6.           └─testthat::source_test_helpers(".", env)
         7.             └─testthat::source_dir(path, "^helper.*\\.[rR]$", env = env, wrap = FALSE)
         8.               └─base::lapply(...)
         9.                 └─testthat (local) FUN(X[[i]], ...)
        10.                   └─testthat::source_file(...)
        11.                     ├─base::withCallingHandlers(...)
        12.                     └─base::eval(exprs, env)
        13.                       └─base::eval(exprs, env)
        14.                         └─app$upload_file(`setup_load-file1` = minimal_data_path) at ./helper-02-data.R:26:5
        15.                           └─shinytest2:::app_upload_file(...)
        16.                             └─shinytest2:::app_find_node_id(self, private, input = names(inputs)[1])
        17.                               └─shinytest2:::app_abort(...)
        18.                                 └─rlang::abort(..., app = self, call = call)
       Execution halted
     ```

## In both

*   checking for detritus in the temp directory ... NOTE
     ```
     Found the following files/directories:
       ‘com.google.Chrome.xmWPKu’
     ```

# MetaNet (0.3.2)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "MetaNet")` for more info

## Newly broken

*   checking examples ... [65s/44s] ERROR
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
     Examples with CPU (user + system) or elapsed time > 5s
                         user system elapsed
     extract_sample_net 21.03  0.019   9.766
     compare_rand       16.26  0.021   8.154
     ```

*   checking examples with --run-donttest ... [187s/106s] ERROR
     ```
     ...
     > data("c_net")
     > if (requireNamespace("ggpmisc")) {
     +   c_net_stability(co_net, mode = "robust_test", step = 20, reps = 9) -> robust_res
     +   plot(robust_res, index = "Average_degree", mode = 2)
     + }
     Loading required namespace: ggpmisc
     > 
     > c_net_stability(co_net, mode = "vulnerability") -> vulnerability_res
     > plot(vulnerability_res)
     > 
     > robustness(co_net) -> robustness_res
     > plot(robustness_res)
     > 
     > module_detect(co_net) -> co_net_modu
     Warning: `erdos.renyi.game()` was deprecated in igraph 0.8.0.
     ℹ Please use `sample_gnm()` instead.
     ℹ The deprecated feature was likely used in the MetaNet package.
       Please report the issue at <https://github.com/Asa12138/MetaNet/issues>.
     > zp_analyse(co_net_modu, mode = 2) -> co_net_modu
     Error in deter_role(x["Pi"], x["Zi"], backs) : object 'role' not found
     Calls: zp_analyse -> apply -> FUN -> deter_role
     Execution halted
     Examples with CPU (user + system) or elapsed time > 5s
                     user system elapsed
     RMT_threshold 74.889  0.063   37.16
     ```

# moranajp (0.9.8)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "moranajp")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,13c6
     < Potential spelling errors:
     <   WORD         FOUND IN
     < UniDic       NEWS.md:13
     < gendai       web_chamame.Rd:53
     < lexeme       NEWS.md:17
     < tidyselect   NEWS.md:24
     < unidic       web_chamame.Rd:53
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# nat (1.8.26)

* : <UNKNOWN>

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

*   checking examples with --run-donttest ... ERROR
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

*   checking tests ... [15s/22s] ERROR
     ```
       Running ‘test-all.R’ [15s/22s]
     Running the tests in ‘tests/test-all.R’ failed.
     Last 13 lines of output:
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
       
       [ FAIL 40 | WARN 2 | SKIP 5 | PASS 601 ]
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

*   checking tests ...
     ```
       Running ‘test-all.R’ [11s/26s]
      [11s/26s] ERROR
     Running the tests in ‘tests/test-all.R’ failed.
     Last 13 lines of output:
        4. └─nat::strahler_order(n)
        5.   └─igraph::bfs(s, root = roots, mode = "out", unreachable = F, father = T)
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-ndigest.R:13:3'): ndigest works for overloaded and regular classes ──
       Expected `ndigest(read.neuron("testdata/neuron/EBT7R.am"))` to equal "a84b2255bb21e35d7906c756e7d14e47".
       Differences:
       1/1 mismatches
       x[1]: "f24c1252d17b6bd9898c7842f1ad9f5d"
       y[1]: "a84b2255bb21e35d7906c756e7d14e47"
       
       [ FAIL 1 | WARN 2 | SKIP 6 | PASS 811 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking for detritus in the temp directory ... NOTE
     ```
     Found the following files/directories:
       ‘com.google.Chrome.XfpaIC’
     ```

# netrics (0.4.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "netrics")` for more info

## Newly broken

*   checking tests ... [74s/39s] ERROR
     ```
       Running ‘testthat.R’ [74s/38s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       
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

# orthGS (0.1.8)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "orthGS")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       Actual inheritance: "NULL"
       ── Failure ('test_orth.R:156:3'): orthology() works properly with UniProt ──────
       Expected `b[[4]]` to inherit from "character".
       Actual inheritance: "NULL"
       ── Failure ('test_orth.R:157:3'): orthology() works properly with UniProt ──────
       Expected `file.exists("./vistoynovisto")` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 15 | WARN 1 | SKIP 0 | PASS 62 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       Actual inheritance: "NULL"
       ── Failure ('test_orth.R:156:3'): orthology() works properly with UniProt ──────
       Expected `b[[4]]` to inherit from "character".
       Actual inheritance: "NULL"
       ── Failure ('test_orth.R:157:3'): orthology() works properly with UniProt ──────
       Expected `file.exists("./vistoynovisto")` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 15 | WARN 1 | SKIP 0 | PASS 62 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# PaRe (0.1.16)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "PaRe")` for more info

## Newly broken

*   checking tests ... [65s/118s] ERROR
     ```
       Running ‘testthat.R’ [65s/118s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       `gitcreds::gitcreds_set()`.
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 16 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-getMultiLineFun.R:38:3'): regular use ────────────────────────
       Expected `... == 1` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 16 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [59s/105s]
      [60s/105s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       `gitcreds::gitcreds_set()`.
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 16 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-getMultiLineFun.R:38:3'): regular use ────────────────────────
       Expected `... == 1` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 16 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# piglet (1.2.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "piglet")` for more info

## Newly broken

*   checking package dependencies ... ERROR
     ```
     Package required but not available: ‘DECIPHER’
     
     Packages suggested but not available for checking:
       'ComplexHeatmap', 'ggtree'
     
     See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
     manual.
     ```

# plantTracker (1.2.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "plantTracker")` for more info

## Newly broken

*   checking tests ... [14s/13s] NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     6,18c6
     < Potential spelling errors:
     <   WORD          FOUND IN
     < al            description:6
     < area'       README.md:922
     < count'      README.md:908
     < dat'        README.md:199,332
     < doi           description:7
     < dormancy'   README.md:549
     < et            description:6
     < linewidth     Suggested_plantTracker_Workflow.Rmd:821
     <               Using_the_plantTracker_trackSpp_function.Rmd:178
     < speciesName   getRecruits.Rd:78
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’ [12s/12s]
     ```

# plotthis (0.13.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "plotthis")` for more info

## Newly broken

*   checking tests ... [61s/60s] ERROR
     ```
       Running ‘testthat.R’ [61s/60s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         1. ├─plotthis::ManhattanPlot(...) at test-manhattanplot.R:64:5
         2. │ └─base::lapply(...)
         3. │   └─plotthis (local) FUN(X[[i]], ...)
         4. │     └─plotthis:::ManhattanPlotAtomic(...)
         5. │       └─base::suppressWarnings(...)
         6. │         └─base::withCallingHandlers(...)
         7. └─base::loadNamespace(x)
         8.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
         9.     └─base (local) withOneRestart(expr, restarts[[1L]])
        10.       └─base (local) doWithOneRestart(return(expr), restart)
       
       [ FAIL 8 | WARN 0 | SKIP 15 | PASS 638 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [62s/61s]
      [62s/61s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         1. ├─plotthis::ManhattanPlot(...) at test-manhattanplot.R:64:5
         2. │ └─base::lapply(...)
         3. │   └─plotthis (local) FUN(X[[i]], ...)
         4. │     └─plotthis:::ManhattanPlotAtomic(...)
         5. │       └─base::suppressWarnings(...)
         6. │         └─base::withCallingHandlers(...)
         7. └─base::loadNamespace(x)
         8.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
         9.     └─base (local) withOneRestart(expr, restarts[[1L]])
        10.       └─base (local) doWithOneRestart(return(expr), restart)
       
       [ FAIL 8 | WARN 0 | SKIP 15 | PASS 638 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking examples with --run-donttest ... [39s/39s] ERROR
     ```
     Running examples in ‘plotthis-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: Heatmap
     > ### Title: Heatmap
     > ### Aliases: Heatmap
     > 
     > ### ** Examples
     > 
     > ## No test: 
     > set.seed(8525)
     > 
     > matrix_data <- matrix(rnorm(60), nrow = 6, ncol = 10)
     > rownames(matrix_data) <- paste0("R", 1:6)
     > colnames(matrix_data) <- paste0("C", 1:10)
     > if (requireNamespace("cluster", quietly = TRUE)) {
     +     Heatmap(matrix_data)
     + }
     Error in loadNamespace(x) : there is no package called ‘ComplexHeatmap’
     Calls: Heatmap ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
     Execution halted
     Examples with CPU (user + system) or elapsed time > 5s
                    user system elapsed
     CorPairsPlot 26.648  0.117  26.768
     ```

# poppr (2.9.8)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "poppr")` for more info

## Newly broken

*   checking tests ... [56s/55s] ERROR
     ```
       Running ‘test-all.R’ [56s/55s]
     Running the tests in ‘tests/test-all.R’ failed.
     Last 13 lines of output:
         4. │   │ └─base::withCallingHandlers(...)
         5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         6. ├─poppr::mlg.table(Pinf)
         7. │ └─poppr:::mlg_barplot(mlgtab, color = color, background = background)
         8. │   └─... %>% dplyr::filter_("count > 0")
         9. └─dplyr::filter_(., "count > 0")
        10.   └─dplyr:::lazy_defunct("filter")
        11.     └─lifecycle::deprecate_stop(...)
        12.       └─lifecycle:::deprecate_stop0(msg)
        13.         └─rlang::cnd_signal(...)
       
       [ FAIL 3 | WARN 510 | SKIP 1 | PASS 991 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘test-all.R’ [50s/50s]
      [51s/51s] ERROR
     Running the tests in ‘tests/test-all.R’ failed.
     Last 13 lines of output:
         4. │   │ └─base::withCallingHandlers(...)
         5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         6. ├─poppr::mlg.table(Pinf)
         7. │ └─poppr:::mlg_barplot(mlgtab, color = color, background = background)
         8. │   └─... %>% dplyr::filter_("count > 0")
         9. └─dplyr::filter_(., "count > 0")
        10.   └─dplyr:::lazy_defunct("filter")
        11.     └─lifecycle::deprecate_stop(...)
        12.       └─lifecycle:::deprecate_stop0(msg)
        13.         └─rlang::cnd_signal(...)
       
       [ FAIL 3 | WARN 538 | SKIP 1 | PASS 991 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘algo.Rnw’ using knitr
     Error: processing vignette 'algo.Rnw' failed with diagnostics:
     Running 'texi2dvi' on 'algo.tex' failed.
     LaTeX errors:
     ! LaTeX Error: File `colortbl.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.4 \makeatletter
                      ^^M
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘algo.Rnw’
     
     SUMMARY: processing the following file failed:
       ‘algo.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# R6causal (0.8.3)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "R6causal")` for more info

## Newly broken

*   checking whether package ‘R6causal’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0.
       Warning: `induced.subgraph()` was deprecated in igraph 2.0.0.
       Warning: `get.vertex.attribute()` was deprecated in igraph 2.0.0.
     See ‘/home/runner/work/_temp/revdep2-work/check/R6causal/new/R6causal.Rcheck/00install.out’ for details.
     ```

# rixpress (0.12.3)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "rixpress")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         9.             └─rix:::hash_git(repo_url = repo_url, commit, ...)
        10.               └─rix:::hash_url(url, repo_url, commit, ...)
        11.                 └─rix:::nix_sri_hash(path = path_to_source_root)
        12.                   └─rix:::stop_no_nix_shell()
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 14 | WARN 1 | SKIP 0 | PASS 148 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         9.             └─rix:::hash_git(repo_url = repo_url, commit, ...)
        10.               └─rix:::hash_url(url, repo_url, commit, ...)
        11.                 └─rix:::nix_sri_hash(path = path_to_source_root)
        12.                   └─rix:::stop_no_nix_shell()
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 14 | WARN 1 | SKIP 0 | PASS 148 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking for detritus in the temp directory ... NOTE
     ```
     Found the following files/directories:
       ‘RtmpfiKdA0_repo_hash_url_axpzk’ ‘RtmpfiKdA0_repo_hash_url_gkmpb’
       ‘RtmpfiKdA0_repo_hash_url_qbrvg’
     ```

# rmangal (2.2.2)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "rmangal")` for more info

## Newly broken

*   checking tests ... [33s/32s] NOTE
     ```
       Running ‘spelling.R’
       Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...
     10,18c10
     < Potential spelling errors:
     <   WORD           FOUND IN
     < commensalism   search_interactions.Rd:58
     < mutualism      search_interactions.Rd:32,59
     <                rmangal.Rmd:77
     < predation      search_interactions.Rd:61
     <                rmangal.Rmd:77
     < vcr            NEWS.md:3
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’ [31s/31s]
     ```

# robber (0.2.4)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "robber")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
     ...
     <                      topological-analysis.Rmd:51,203,251,281,289,557
     < cran                 NEWS.md:11
     <                      README.md:29
     < dependences          NEWS.md:5
     < doi                  description:3
     < dynamik              pollination.Rd:18
     < env                  description:3
     < et                   pollination.Rd:18
     < frugivores           seeddispersal.Rd:20
     < ggplot               plot.robber.Rd:14
     < mesoscale            README.md:43
     <                      topological-analysis.Rmd:35,203,229,251,281,287,427,555,557,563
     < mutualistic          topological-analysis.Rmd:203
     < og                   pollination.Rd:18
     < phylogenies          hostparasite.Rd:20
     < på                  pollination.Rd:18
     < rainforest           seeddispersal.Rd:20
     < submontane           seeddispersal.Rd:20
     < tid                  pollination.Rd:18
     < topologies           topological-analysis.Rmd:313,563
     < Øer                 pollination.Rd:18
     < If these are false positive, run `spelling::update_wordlist()`.All Done!
     ---
     > All Done!
       Running ‘testthat.R’
     ```

# rphylopic (1.7.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "rphylopic")` for more info

## Newly broken

*   checking tests ... [21s/103s] ERROR
     ```
       Running ‘test-all.R’ [21s/103s]
     Running the tests in ‘tests/test-all.R’ failed.
     Last 13 lines of output:
           ▆
        1. ├─testthat::expect_warning(...) at test-resolve_phylopic.R:57:3
        2. │ └─testthat:::expect_condition_matching_(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─rphylopic::resolve_phylopic(...) at test-resolve_phylopic.R:58:5
        8.   └─rphylopic:::check_url("https://eol.org/api/search/1.0.json")
        9.     └─httr::stop_for_status(head_response, task = "access the desired API")
       
       [ FAIL 2 | WARN 0 | SKIP 2 | PASS 260 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘test-all.R’ [22s/71s]
      [23s/71s] ERROR
     Running the tests in ‘tests/test-all.R’ failed.
     Last 13 lines of output:
                            (right here) ------^
       
       Backtrace:
           ▆
        1. └─rphylopic::get_attribution(uuid = uuid, permalink = TRUE) at test-get_attribution.R:16:3
        2.   └─rphylopic:::response_to_JSON(coll)
        3.     └─jsonlite::fromJSON(tmp)
        4.       └─jsonlite:::parse_and_simplify(...)
        5.         └─jsonlite:::parseJSON(txt, bigint_as_char)
        6.           └─jsonlite:::parse_string(txt, bigint_as_char)
       
       [ FAIL 1 | WARN 0 | SKIP 2 | PASS 265 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# SEMdeep (1.1.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "SEMdeep")` for more info

## Newly broken

*   checking examples with --run-donttest ... [50s/27s] ERROR
     ```
     ...
     > 
     > # ... rf
     > res2<- SEMml(ig, data[train, ], algo="rf", ncores = ncores)
     Running SEM model via ML...
      done.
     
     RF solver ended normally after 23 iterations
     
      logL:-33.16687  srmr:0.086188
     > 
     > # ... xgb
     > res3<- SEMml(ig, data[train, ], algo="xgb", ncores = ncores)
     Running SEM model via ML...
      done.
     
     XGB solver ended normally after 23 iterations
     
      logL:69.930993  srmr:0.001418
     > 
     > # ... sem
     > res4<- SEMml(ig, data[train, ], algo="sem")
     Running SEM model via ML...
     Error in x[, ii] : subscript out of bounds
     Calls: SEMml ... model.frame.default -> na.omit -> na.omit.data.frame
     Execution halted
     ```

# SemNeT (1.4.5)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "SemNeT")` for more info

## Newly broken

*   checking examples with --run-donttest ... ERROR
     ```
     Running examples in ‘SemNeT-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: bootSemNeT
     > ### Title: Bootstrapped Semantic Network Analysis
     > ### Aliases: bootSemNeT
     > 
     > ### ** Examples
     > 
     > # Simulate Dataset
     > one <- sim.fluency(20)
     > ## No test: 
     > # Run bootstrap node-drop (partial) networks
     > one.result <- bootSemNeT(one, prop = .50, iter = 100,
     + sim = "cosine", cores = 2, method = "TMFG", type = "node")
     Generating data...done
     
     Computing similarity measures...
     Estimating networks...
     Error in serverSocket(port = port) : 
       creation of server socket failed: port 11484 cannot be opened
     Calls: bootSemNeT -> <Anonymous> -> makePSOCKcluster -> serverSocket
     Execution halted
     ```

# semPlot (1.2.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "semPlot")` for more info

## Newly broken

*   checking tests ... [20s/18s] ERROR
     ```
       Running ‘regression-tests.R’ [20s/18s]
     Running the tests in ‘tests/regression-tests.R’ failed.
     Last 13 lines of output:
       +     watSAT <- m@Pars[m@Pars$edge == "~>" & m@Pars$rhs == "SAT" & grepl("^sat", m@Pars$lhs), ]
       +     loads <- m@Pars[m@Pars$edge == "->" & m@Pars$lhs %in% c("IMAG","EXPE"), ]
       +     noSATload <- !any(m@Pars$edge == "->" & m@Pars$lhs == "SAT")
       +     struct <- m@Pars[m@Pars$edge == "~>" & m@Pars$lhs %in% c("IMAG","EXPE") & m@Pars$rhs %in% c("EXPE","SAT"), ]
       +     nrow(watSAT) == 3 && nrow(loads) == 6 && noSATload && nrow(struct) == 2 &&
       +       inherits(quiet(semPaths(csem_fit, DoNotPlot = TRUE)), "qgraph") })
       + }
       PASS: T15e2 cSEM: composites get weights, common factors loadings; renders 
       > 
       > cat("\n==== RESULT:", ok, "passed,", fail, "failed ====\n")
       
       ==== RESULT: 93 passed, 1 failed ====
       > if (fail > 0) stop("semPlot regression tests failed: ", paste(fails, collapse = "; "))
       Error: semPlot regression tests failed: T12b blavaan matches lavaan edge structure and renders
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘regression-tests.R’ [19s/17s]
      [20s/17s] ERROR
     Running the tests in ‘tests/regression-tests.R’ failed.
     Last 13 lines of output:
       +     watSAT <- m@Pars[m@Pars$edge == "~>" & m@Pars$rhs == "SAT" & grepl("^sat", m@Pars$lhs), ]
       +     loads <- m@Pars[m@Pars$edge == "->" & m@Pars$lhs %in% c("IMAG","EXPE"), ]
       +     noSATload <- !any(m@Pars$edge == "->" & m@Pars$lhs == "SAT")
       +     struct <- m@Pars[m@Pars$edge == "~>" & m@Pars$lhs %in% c("IMAG","EXPE") & m@Pars$rhs %in% c("EXPE","SAT"), ]
       +     nrow(watSAT) == 3 && nrow(loads) == 6 && noSATload && nrow(struct) == 2 &&
       +       inherits(quiet(semPaths(csem_fit, DoNotPlot = TRUE)), "qgraph") })
       + }
       PASS: T15e2 cSEM: composites get weights, common factors loadings; renders 
       > 
       > cat("\n==== RESULT:", ok, "passed,", fail, "failed ====\n")
       
       ==== RESULT: 93 passed, 1 failed ====
       > if (fail > 0) stop("semPlot regression tests failed: ", paste(fails, collapse = "; "))
       Error: semPlot regression tests failed: T12b blavaan matches lavaan edge structure and renders
       Execution halted
     ```

# Seurat (5.5.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "Seurat")` for more info

## Newly broken

*   checking tests ... [205s/185s] ERROR
     ```
       Running ‘testthat.R’ [205s/185s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
        2.   └─testthat::expect_equal(abs(x), abs(y), tolerance = tolerance) at test_integration5.R:8:3
       ── Failure ('test_integration5.R:112:3'): IntegrateLayers works with CCAIntegration ──
       Expected `abs(x)` to equal `abs(y)`.
       Differences:
       1/1 mismatches
       [1] 1.16 - 1.49 == -0.326
       Backtrace:
           ▆
        1. └─Seurat (local) expect_abs_equal(...) at test_integration5.R:112:3
        2.   └─testthat::expect_equal(abs(x), abs(y), tolerance = tolerance) at test_integration5.R:8:3
       
       [ FAIL 8 | WARN 0 | SKIP 9 | PASS 1116 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [164s/145s]
      [165s/145s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
        2.   └─testthat::expect_equal(abs(x), abs(y), tolerance = tolerance) at test_integration5.R:8:3
       ── Failure ('test_integration5.R:112:3'): IntegrateLayers works with CCAIntegration ──
       Expected `abs(x)` to equal `abs(y)`.
       Differences:
       1/1 mismatches
       [1] 1.16 - 1.49 == -0.326
       Backtrace:
           ▆
        1. └─Seurat (local) expect_abs_equal(...) at test_integration5.R:112:3
        2.   └─testthat::expect_equal(abs(x), abs(y), tolerance = tolerance) at test_integration5.R:8:3
       
       [ FAIL 2 | WARN 0 | SKIP 8 | PASS 1151 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# sfclust (1.1.0)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "sfclust")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
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

# spinner (1.1.1)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "spinner")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         5. │     │ └─base::withCallingHandlers(...)
         6. │     ├─purrr:::call_with_cleanup(...)
         7. │     └─spinner (local) .f(...)
         8. │       └─spinner::spinner(...)
         9. │         └─torch::torch_manual_seed(seed)
        10. │           └─torch:::cpp_torch_manual_seed(as.character(seed))
        11. ├─base::stop(`<std::rn_>`)
        12. └─purrr (local) `<fn>`(`<std::rn_>`)
        13.   └─cli::cli_abort(...)
        14.     └─rlang::abort(...)
       
       [ FAIL 5 | WARN 24 | SKIP 0 | PASS 0 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         5. │     │ └─base::withCallingHandlers(...)
         6. │     ├─purrr:::call_with_cleanup(...)
         7. │     └─spinner (local) .f(...)
         8. │       └─spinner::spinner(...)
         9. │         └─torch::torch_manual_seed(seed)
        10. │           └─torch:::cpp_torch_manual_seed(as.character(seed))
        11. ├─base::stop(`<std::rn_>`)
        12. └─purrr (local) `<fn>`(`<std::rn_>`)
        13.   └─cli::cli_abort(...)
        14.     └─rlang::abort(...)
       
       [ FAIL 5 | WARN 24 | SKIP 0 | PASS 0 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# tidygraph (1.3.1)

* : <UNKNOWN>

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
       Running ‘testthat.R’
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
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
       
       [ FAIL 6 | WARN 55 | SKIP 0 | PASS 424 ]
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

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "vkR")` for more info

## Newly broken

*   checking dependencies in R code ... WARNING
     ```
     Missing or unexported object: ‘igraph::get.edge’
     ```

# zoomerjoin (0.2.3)

* : <UNKNOWN>

Run `revdepcheck::revdep_details(, "zoomerjoin")` for more info

## Newly broken

*   checking tests ... [41s/30s] ERROR
     ```
       Running ‘testthat.R’ [41s/30s]
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
           ▆
        1. └─vdiffr::expect_doppelganger(...) at test-curves.R:19:3
        2.   ├─base::withCallingHandlers(...)
        3.   └─testthat::expect_snapshot_file(...)
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 2 | WARN 0 | SKIP 0 | PASS 291 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## Newly fixed

*   checking tests ...
     ```
       Running ‘testthat.R’ [34s/24s]
      [34s/24s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
           ▆
        1. └─vdiffr::expect_doppelganger(...) at test-curves.R:19:3
        2.   ├─base::withCallingHandlers(...)
        3.   └─testthat::expect_snapshot_file(...)
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 2 | WARN 0 | SKIP 0 | PASS 291 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking Rust compilation ... WARNING
     ```
       Downloads Rust crates
     ```

*   checking compiled code ... NOTE
     ```
     File ‘zoomerjoin/libs/zoomerjoin.so’:
       Found non-API call to R: ‘R_NamespaceRegistry’
     
     Compiled code should not call non-API entry points in R.
     
     See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual,
     and section ‘Moving into C API compliance’ for issues with the use of
     non-API entry points.
     ```

