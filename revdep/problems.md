# alakazam

<details>

* Version: 1.2.1
* GitHub: NA
* Source code: https://github.com/cran/alakazam
* Date/Publication: 2022-09-20 22:10:02 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "alakazam")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘alakazam-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getMRCA
    > ### Title: Retrieve the first non-root node of a lineage tree
    > ### Aliases: getMRCA
    > 
    > ### ** Examples
    > 
    > # Define example graph
    ...
    > 
    > # Use unweighted path length and do not exclude any nodes
    > getMRCA(graph, path="steps", root="Germline")
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: getMRCA -> getPathLengths -> data.frame -> V -> vcount
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘AminoAcids-Vignette.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/grffile.sty'' had status 1
    ...
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘Topology-Vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘AminoAcids-Vignette.Rmd’ ‘Diversity-Vignette.Rmd’
      ‘Fastq-Vignette.Rmd’ ‘Files-Vignette.Rmd’ ‘GeneUsage-Vignette.Rmd’
      ‘Lineage-Vignette.Rmd’ ‘Topology-Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# aniSNA

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/aniSNA
* Date/Publication: 2023-02-17 09:50:09 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "aniSNA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘aniSNA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: elk_network_2010
    > ### Title: An igraph object depicting the network obtained from
    > ###   elk_interactions_2010
    > ### Aliases: elk_network_2010
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > igraph::E(elk_network_2010)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in ecount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: <Anonymous> -> ecount
    Execution halted
    ```

# bc3net

<details>

* Version: 1.0.4
* GitHub: NA
* Source code: https://github.com/cran/bc3net
* Date/Publication: 2016-11-28 08:21:04
* Number of recursive dependencies: 9

Run `revdepcheck::cloud_details(, "bc3net")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bc3net-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: enrichment
    > ### Title: Function that performs a functional enrichment analysis based on
    > ###   a one-sided Fisher's exact teset (hypergeometric test).
    > ### Aliases: enrichment
    > 
    > ### ** Examples
    > 
    ...
    > # as a reference list.
    > 
    > data(exanet)
    > data(exgensets)
    > 
    > candidate=V(getgcc(exanet))$name
    Error in clusters(net) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: V -> is_igraph -> %in% -> getgcc -> clusters
    Execution halted
    ```

# bio3d

<details>

* Version: 2.4-4
* GitHub: NA
* Source code: https://github.com/cran/bio3d
* Date/Publication: 2022-10-26 22:45:06 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "bio3d")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bio3d-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: print.cna
    > ### Title: Summarize and Print Features of a cna Network Graph
    > ### Aliases: print.cna summary.cna
    > ### Keywords: utilities
    > 
    > ### ** Examples
    > 
    ...
    + x<- summary(net)
    + x$members[[2]]
    + 
    + detach(hivp)
    + 
    + }
    Error in igraph::ecount(x$network) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: print -> print.cna -> paste -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.0Mb
      sub-directories of 1Mb or more:
        libs   7.3Mb
    ```

# causaloptim

<details>

* Version: 0.9.7
* GitHub: https://github.com/sachsmc/causaloptim
* Source code: https://github.com/cran/causaloptim
* Date/Publication: 2023-03-24 12:00:15 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "causaloptim")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `vcount(graph)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. └─igraph::V(`*tmp*`) at test-known-bounds.R:57:4
       2.   └─igraph::vcount(graph)
      ── Error ('test-known-bounds.R:144:5'): Mediator ───────────────────────────────
      Error in `vcount(graph)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. └─igraph::V(`*tmp*`) at test-known-bounds.R:144:4
       2.   └─igraph::vcount(graph)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 7 ]
      Error: Test failures
      Execution halted
    ```

# chemodiv

<details>

* Version: 0.2.0
* GitHub: https://github.com/hpetren/chemodiv
* Source code: https://github.com/cran/chemodiv
* Date/Publication: 2023-01-12 09:30:06 UTC
* Number of recursive dependencies: 168

Run `revdepcheck::cloud_details(, "chemodiv")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘chemodiv-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: molNetPlot
    > ### Title: Plot molecular networks
    > ### Aliases: molNetPlot
    > 
    > ### ** Examples
    > 
    > data(minimalSampData)
    ...
    > data(minimalNPCTable)
    > data(minimalMolNet)
    > groups <- c("A", "A", "B", "B")
    > molNetPlot(minimalSampData, minimalMolNet)
    It is recommended to include an npcTable for an improved
                network visualization.
    Error in vertex.attributes(graph) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: molNetPlot ... node_tibble -> as_tibble -> vertex_attr -> vertex.attributes
    Execution halted
    ```

# CINNA

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/CINNA
* Date/Publication: 2022-04-07 15:12:31 UTC
* Number of recursive dependencies: 143

Run `revdepcheck::cloud_details(, "CINNA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CINNA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calculate_centralities
    > ### Title: Centrality measure calculation
    > ### Aliases: calculate_centralities
    > 
    > ### ** Examples
    > 
    > 
    > data("zachary")
    > p <- proper_centralities(zachary)
    Error in is_directed(x) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: proper_centralities -> is_directed
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘CINNA.Rmd’ using rmarkdown
    Quitting from lines 67-71 (CINNA.Rmd) 
    Error: processing vignette 'CINNA.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘CINNA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘CINNA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘circlize’
      All declared Imports should be used.
    ```

# clustAnalytics

<details>

* Version: 0.5.2
* GitHub: NA
* Source code: https://github.com/cran/clustAnalytics
* Date/Publication: 2022-11-09 11:50:09 UTC
* Number of recursive dependencies: 71

Run `revdepcheck::cloud_details(, "clustAnalytics")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘clustAnalytics-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: FOMD
    > ### Title: FOMD (Fraction Over Median Degree)
    > ### Aliases: FOMD
    > 
    > ### ** Examples
    > 
    > data(karate, package="igraphdata")
    > FOMD(karate, membership(cluster_louvain(karate)))
    Error in matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: FOMD ... igraph_to_edgelist -> cbind -> as_edgelist -> matrix
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test_scoring_functions.R:8:5'): test scoring functions ──────────────
      Error in `edge.attributes(g)`: VECTOR_ELT() can only be applied to a 'list', not a 'environment'
      Backtrace:
          ▆
       1. ├─testthat::expect_equal_to_reference(...) at test_scoring_functions.R:8:4
       2. │ └─testthat::expect_known_value(..., update = update)
       3. │   └─testthat::quasi_label(enquo(object), label, arg = "object")
       4. │     └─rlang::eval_bare(expr, quo_get_env(quo))
       5. └─clustAnalytics::scoring_functions(...)
       6.   ├─"weight" %in% names(edge.attributes(g))
       7.   └─igraph::edge.attributes(g)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘cluster_stability.Rmd’ using rmarkdown
    Quitting from lines 24-29 (cluster_stability.Rmd) 
    Error: processing vignette 'cluster_stability.Rmd' failed with diagnostics:
    VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    --- failed re-building ‘cluster_stability.Rmd’
    
    --- re-building ‘graph_rewiring_functions.Rmd’ using rmarkdown
    Quitting from lines 30-32 (graph_rewiring_functions.Rmd) 
    Error: processing vignette 'graph_rewiring_functions.Rmd' failed with diagnostics:
    ...
    VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    --- failed re-building ‘stability_significance_examples.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cluster_stability.Rmd’ ‘graph_rewiring_functions.Rmd’
      ‘other_functions.Rmd’ ‘scoring_functions.Rmd’
      ‘stability_significance_examples.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        libs   6.1Mb
    ```

# crosstalkr

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/crosstalkr
* Date/Publication: 2023-01-31 09:00:07 UTC
* Number of recursive dependencies: 167

Run `revdepcheck::cloud_details(, "crosstalkr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘crosstalkr_vignette.Rmd’ using rmarkdown
    Quitting from lines 72-77 (crosstalkr_vignette.Rmd) 
    Error: processing vignette 'crosstalkr_vignette.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘crosstalkr_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘crosstalkr_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dnet

<details>

* Version: 1.1.7
* GitHub: https://github.com/hfang-bristol/dnet
* Source code: https://github.com/cran/dnet
* Date/Publication: 2020-02-20 10:10:07 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "dnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dDAGancestor
    > ### Title: Function to find common ancestors of two terms/nodes from a
    > ###   direct acyclic graph (DAG)
    > ### Aliases: dDAGancestor
    > 
    > ### ** Examples
    > 
    ...
    > 
    > # 2) randomly give two terms
    > term1 <- sample(V(g)$name,1)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: sample -> V -> vcount
    Execution halted
    ```

# DrDimont

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/DrDimont
* Date/Publication: 2022-09-23 15:40:02 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "DrDimont")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DrDimont-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compute_drug_response_scores
    > ### Title: Calculate drug response score
    > ### Aliases: compute_drug_response_scores
    > 
    > ### ** Examples
    > 
    > data(drug_target_edges_example)
    ...
    > example_drug_response_scores <- compute_drug_response_scores(
    +                                     differential_graph=differential_graph_example,
    +                                     drug_targets=drug_target_edges_example$targets,
    +                                     settings=example_settings)
    [23-04-21 14:50:48] Computing drug response scores based on the mean of the differential scores ...
    
    Error in matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: compute_drug_response_scores -> <Anonymous> -> as_edgelist -> matrix
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DrDimont_Vignette.Rmd’ using rmarkdown
    Quitting from lines 400-409 (DrDimont_Vignette.Rmd) 
    Error: processing vignette 'DrDimont_Vignette.Rmd' failed with diagnostics:
    VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    --- failed re-building ‘DrDimont_Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DrDimont_Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# DTSEA

<details>

* Version: 0.0.3
* GitHub: NA
* Source code: https://github.com/cran/DTSEA
* Date/Publication: 2022-11-06 13:20:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "DTSEA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DTSEA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calculate_p0
    > ### Title: Function to calculate the p0 vector used in Random Walk with
    > ###   Restart (RwR)
    > ### Aliases: calculate_p0
    > 
    > ### ** Examples
    > 
    ...
    > 
    > # Compute the p0 vector
    > p0 <- calculate_p0(nodes = example_ppi, disease = example_disease_list)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: calculate_p0 -> V -> vcount
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DTSEA.Rmd’ using rmarkdown
    Quitting from lines 54-67 (DTSEA.Rmd) 
    Error: processing vignette 'DTSEA.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘DTSEA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DTSEA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dynwrap

<details>

* Version: 1.2.3
* GitHub: https://github.com/dynverse/dynwrap
* Source code: https://github.com/cran/dynwrap
* Date/Publication: 2023-03-01 17:10:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "dynwrap")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dynwrap-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: trajectory_type_dag
    > ### Title: A DAG connecting different trajectory types
    > ### Aliases: trajectory_type_dag
    > ### Keywords: create_ti_method
    > 
    > ### ** Examples
    > 
    > trajectory_type_dag
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in is_directed(object) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: <Anonymous> ... print.igraph -> .print.header -> paste0 -> is_directed
    Execution halted
    ```

# edgebundle

<details>

* Version: 0.4.1
* GitHub: https://github.com/schochastics/edgebundle
* Source code: https://github.com/cran/edgebundle
* Date/Publication: 2022-11-22 07:00:02 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "edgebundle")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘edgebundle-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: metro_multicriteria
    > ### Title: Metro Map Layout
    > ### Aliases: metro_multicriteria
    > 
    > ### ** Examples
    > 
    > # the algorithm has problems with parallel edges
    ...
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    > g <- simplify(metro_berlin)
    Error in simplify(metro_berlin) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 22 marked UTF-8 strings
    ```

# einet

<details>

* Version: 0.1.0
* GitHub: https://github.com/travisbyrum/einet
* Source code: https://github.com/cran/einet
* Date/Publication: 2020-04-23 17:20:03 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "einet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_lte(effective_information(karate) - 2.35, MAX_ERROR) at test_effective_information.R:76:2
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─einet::effective_information(karate)
        5. ├─einet:::effective_information.igraph(karate)
        6. │ └─einet:::check_network(graph)
        7. │   └─graph %>% igraph::simplify(remove.loops = FALSE) %>% ...
        8. ├─igraph::as.directed(.)
        9. │ └─igraph::is_igraph(graph)
       10. │   └─"igraph" %in% class(graph)
       11. └─igraph::simplify(., remove.loops = FALSE)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

# emba

<details>

* Version: 0.1.8
* GitHub: https://github.com/bblodfon/emba
* Source code: https://github.com/cran/emba
* Date/Publication: 2021-01-07 04:00:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "emba")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘emba.Rmd’ using rmarkdown
    Quitting from lines 208-210 (emba.Rmd) 
    Error: processing vignette 'emba.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘emba.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘emba.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# etree

<details>

* Version: 0.1.0
* GitHub: https://github.com/ricgbl/etree
* Source code: https://github.com/cran/etree
* Date/Publication: 2022-07-16 08:30:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "etree")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─etree::etree(resp_cls, covs_cls, split_type = "cluster")
        8.   └─base::lapply(covariates, dist_comp)
        9.     └─etree (local) FUN(X[[i]], ...)
       10.       └─base::sapply(x, function(i) is.null(igraph::edge.attributes(i)$weight))
       11.         └─base::lapply(X = X, FUN = FUN, ...)
       12.           └─etree (local) FUN(X[[i]], ...)
       13.             └─igraph::edge.attributes(i)
      
      [ FAIL 25 | WARN 1 | SKIP 0 | PASS 46 ]
      Error: Test failures
      Execution halted
    ```

# gemtc

<details>

* Version: 1.0-1
* GitHub: https://github.com/gertvv/gemtc
* Source code: https://github.com/cran/gemtc
* Date/Publication: 2021-05-14 23:20:02 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "gemtc")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test.R’
    Running the tests in ‘tests/test.R’ failed.
    Last 13 lines of output:
        5.       └─testthat:::compare.default(act$val, exp$val, ...)
        6.         ├─base::all.equal(x, y, ...)
        7.         └─base::all.equal.default(x, y, ...)
        8.           └─base::all.equal.list(target, current, ...)
        9.             ├─base::all.equal(...)
       10.             └─base::all.equal.default(...)
       11.               └─base::all.equal.list(target, current, ...)
       12.                 └─base::attr.all.equal(target, current, ...)
       13.                   ├─base::length(target)
       14.                   └─igraph:::length.igraph(target)
       15.                     └─igraph::vcount(x)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 376 ]
      Error: Test failures
      Execution halted
    ```

# geonetwork

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/geonetwork
* Date/Publication: 2023-04-14 08:30:02 UTC
* Number of recursive dependencies: 156

Run `revdepcheck::cloud_details(, "geonetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘geonetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.geonetwork
    > ### Title: Plot a geonetwork
    > ### Aliases: plot.geonetwork
    > 
    > ### ** Examples
    > 
    > plot(eurodist, axes = TRUE, type = "n")
    Error in vertex.attributes(graph) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: plot ... plot.geonetwork -> <Anonymous> -> vertex_attr -> vertex.attributes
    Execution halted
    ```

# GISSB

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/GISSB
* Date/Publication: 2023-01-10 18:33:14 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "GISSB")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GISSB-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: path_leaflet
    > ### Title: Visualize the shortest path with Leaflet
    > ### Aliases: path_leaflet
    > 
    > ### ** Examples
    > 
    > 
    ...
    > shortest_path_igraph(from_node_ID = 25,
    +                              to_node_ID = 33,
    +                              unit = "minutes",
    +                              path = TRUE,
    +                              graph_object = graph_sampledata) %>%
    +                              path_leaflet(graph_object = graph_sampledata)
    Error in edge.attributes(graph) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: %>% ... edge_tibble -> as_tibble -> edge_attr -> edge.attributes
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 866 marked UTF-8 strings
    ```

# grand

<details>

* Version: 0.9.0
* GitHub: https://github.com/zpneal/grand
* Source code: https://github.com/cran/grand
* Date/Publication: 2023-02-10 10:30:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "grand")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘grand-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: grand
    > ### Title: Apply Guidelines for Reporting About Network Data (GRAND) to an
    > ###   igraph object
    > ### Aliases: grand
    > 
    > ### ** Examples
    > 
    > data(airport)  #Load example data
    > airport <- grand(airport)  #Apply GRAND interactively
    Error in igraph::is_simple(G) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: grand -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘grand.Rmd’ using rmarkdown
    Quitting from lines 167-178 (grand.Rmd) 
    Error: processing vignette 'grand.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘grand.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘grand.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# graph4lg

<details>

* Version: 1.8.0
* GitHub: NA
* Source code: https://github.com/cran/graph4lg
* Date/Publication: 2023-01-30 14:00:05 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "graph4lg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graph4lg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_nodes_attr
    > ### Title: Add attributes to the nodes of a graph
    > ### Aliases: add_nodes_attr
    > 
    > ### ** Examples
    > 
    > data("data_tuto")
    ...
    > graph <- data_tuto[[3]]
    > df_nodes <- data.frame(Id = igraph::V(graph)$name,
    +                        Area = runif(50, min = 10, max = 60))
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: data.frame -> <Anonymous> -> vcount
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘genetic_graph_2.Rmd’ using rmarkdown
    Quitting from lines 227-228 (genetic_graph_2.Rmd) 
    Error: processing vignette 'genetic_graph_2.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘genetic_graph_2.Rmd’
    
    --- re-building ‘graph_comparisons_4.Rmd’ using rmarkdown
    --- finished re-building ‘graph_comparisons_4.Rmd’
    ...
    Quitting from lines 426-430 (landscape_graph_3.Rmd) 
    Error: processing vignette 'landscape_graph_3.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘landscape_graph_3.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘genetic_graph_2.Rmd’ ‘landscape_graph_3.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Error loading dataset 'data_tuto':
       Error in vcount(x) : 
        REAL() can only be applied to a 'numeric', not a 'logical'
      
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# graphkernels

<details>

* Version: 1.6.1
* GitHub: NA
* Source code: https://github.com/cran/graphkernels
* Date/Publication: 2021-12-20 09:00:02 UTC
* Number of recursive dependencies: 9

Run `revdepcheck::cloud_details(, "graphkernels")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphkernels-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CalculateConnectedGraphletKernel
    > ### Title: Connected graphlet kernel
    > ### Aliases: CalculateConnectedGraphletKernel
    > ### Keywords: graph kernel graphlet
    > 
    > ### ** Examples
    > 
    > data(mutag)
    > K <- CalculateConnectedGraphletKernel(mutag, 4)
    Error in is_directed(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: CalculateConnectedGraphletKernel -> as_adj_list -> is_directed
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 15.6Mb
      sub-directories of 1Mb or more:
        libs  15.4Mb
    ```

# graphlayouts

<details>

* Version: 0.8.4
* GitHub: https://github.com/schochastics/graphlayouts
* Source code: https://github.com/cran/graphlayouts
* Date/Publication: 2022-11-24 06:20:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "graphlayouts")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphlayouts-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: layout_multilevel
    > ### Title: multilevel layout
    > ### Aliases: layout_multilevel layout_as_multilevel
    > ###   layout_igraph_multilevel
    > 
    > ### ** Examples
    > 
    ...
        union
    
    > data("multilvl_ex")
    > 
    > # compute a layout for the whole network
    > xy <- layout_as_multilevel(multilvl_ex,type = "all", alpha = 25, beta = 45)
    Error in igraph::vertex_attr_names(g) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: layout_as_multilevel -> %in% -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-layout_multilevel.R:3:3'): layout_mulitlevel works ─────────────
      Error in `igraph::vertex_attr_names(g)`: VECTOR_ELT() can only be applied to a 'list', not a 'environment'
      Backtrace:
          ▆
       1. ├─testthat::expect_is(...) at test-layout_multilevel.R:3:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─graphlayouts::layout_as_multilevel(...)
       5.   ├─"lvl" %in% igraph::vertex_attr_names(g)
       6.   └─igraph::vertex_attr_names(g)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 71 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.1Mb
      sub-directories of 1Mb or more:
        help   2.4Mb
        libs   6.5Mb
    ```

# graphsim

<details>

* Version: 1.0.3
* GitHub: https://github.com/TomKellyGenetics/graphsim
* Source code: https://github.com/cran/graphsim
* Date/Publication: 2022-09-12 06:12:54 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "graphsim")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphsim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_expression
    > ### Title: Generate Simulated Expression
    > ### Aliases: generate_expression generate_expression_mat
    > ### Keywords: graph igraph mvtnorm network simulation
    > 
    > ### ** Examples
    > 
    ...
    > # absolute = FALSE (geometric distance by default)
    >  # compute states directly from graph attributes for TGF-\eqn{\Beta} pathway
    > TGFBeta_Smad_state <- E(TGFBeta_Smad_graph)$state
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in ecount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: E -> ecount
    Execution halted
    ```

# iGraphMatch

<details>

* Version: 2.0.1
* GitHub: https://github.com/dpmcsuss/iGraphMatch
* Source code: https://github.com/cran/iGraphMatch
* Date/Publication: 2022-09-13 18:30:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "iGraphMatch")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘iGraphMatch-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: C.Elegans
    > ### Title: Chemical synapses and electrical synapses networks of roundworm
    > ### Aliases: C.Elegans
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(C.Elegans)
    > g1 <- C.Elegans[[1]]
    > g2 <- C.Elegans[[2]]
    > plot(g1, g2)
    Error in igraph::vcount(x) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: plot -> plot -> .local -> identity_match -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘iGraphMatch.Rmd’ using rmarkdown
    Quitting from lines 951-987 (iGraphMatch.Rmd) 
    Error: processing vignette 'iGraphMatch.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘iGraphMatch.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘iGraphMatch.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# influenceR

<details>

* Version: 0.1.0.1
* GitHub: https://github.com/rcc-uchicago/influenceR
* Source code: https://github.com/cran/influenceR
* Date/Publication: 2021-09-25 10:15:40 UTC
* Number of recursive dependencies: 35

Run `revdepcheck::cloud_details(, "influenceR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4. │     └─rlang::eval_bare(expr, quo_get_env(quo))
       5. └─influenceR::betweenness(flo_graph)
       6.   └─igraph::get.edgelist(g, names = F)
       7.     └─base::matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2)
      ── Error ('test_reference.R:72:3'): bridging matches reference function ────────
      Error in `vcount(graph)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. └─influenceR (local) bridge_test(flo_graph) at test_reference.R:72:2
       2.   └─igraph::V(g) at test_reference.R:26:2
       3.     └─igraph::vcount(graph)
      
      [ FAIL 5 | WARN 2 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# intergraph

<details>

* Version: 2.0-2
* GitHub: NA
* Source code: https://github.com/cran/intergraph
* Date/Publication: 2016-12-05 18:28:47
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "intergraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘intergraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: asDF
    > ### Title: Convert network to data frame(s)
    > ### Aliases: asDF asDF.igraph asDF.network
    > 
    > ### ** Examples
    > 
    > # using method for 'network' objects
    ...
      ..$ label        : chr [1:15] "a" "b" "c" "d" ...
      ..$ na           : logi [1:15] FALSE FALSE FALSE FALSE FALSE FALSE ...
      ..$ vertex.names : chr [1:15] "a" "b" "c" "d" ...
    > 
    > # using method for 'igraph' objects
    > d2 <- asDF(exIgraph)
    Error in matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: asDF ... asDF.igraph -> as.data.frame -> <Anonymous> -> matrix
    Execution halted
    ```

# invertiforms

<details>

* Version: 0.1.1
* GitHub: https://github.com/RoheLab/invertiforms
* Source code: https://github.com/cran/invertiforms
* Date/Publication: 2022-11-25 12:40:10 UTC
* Number of recursive dependencies: 50

Run `revdepcheck::cloud_details(, "invertiforms")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘invertiforms-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: DoubleCenter
    > ### Title: Construct and use DoubleCenter transformations
    > ### Aliases: DoubleCenter transform,DoubleCenter,sparseMatrix-method
    > ###   inverse_transform,DoubleCenter,sparseLRMatrix-method
    > ###   inverse_transform,DoubleCenter,vsp_fa-method
    > 
    > ### ** Examples
    ...
    
    > library(igraphdata)
    > 
    > data("karate", package = "igraphdata")
    > 
    > A <- get.adjacency(karate)
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: get.adjacency -> get.adjacency.sparse -> vcount
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─igraph::get.adjacency(karate) at test-PerturbedLaplacian.R:6:0
       2.   └─igraph:::get.adjacency.sparse(...)
       3.     └─igraph::vcount(graph)
      ── Error ('test-RegularizedLaplacian.R:6:1'): (code run outside of `test_that()`) ──
      Error in `vcount(graph)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. └─igraph::get.adjacency(karate) at test-RegularizedLaplacian.R:6:0
       2.   └─igraph:::get.adjacency.sparse(...)
       3.     └─igraph::vcount(graph)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# ITNr

<details>

* Version: 0.7.0
* GitHub: NA
* Source code: https://github.com/cran/ITNr
* Date/Publication: 2023-03-31 14:10:11 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "ITNr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ITNr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ITNproperties
    > ### Title: ITN Properties
    > ### Aliases: ITNproperties
    > 
    > ### ** Examples
    > 
    > ##Load the network
    > data(ELEnet16)
    > 
    > ##Calculate the network properties
    > ITNPROP<-ITNproperties(ELEnet16,TRUE)
    Error in matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: ITNproperties -> cbind -> <Anonymous> -> matrix
    Execution halted
    ```

# LEANR

<details>

* Version: 1.4.9
* GitHub: NA
* Source code: https://github.com/cran/LEANR
* Date/Publication: 2016-11-12 15:47:01
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "LEANR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test_output.R:8:1'): (code run outside of `test_that()`) ────────────
      Error in `vcount(graph)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. └─LEANR::run.lean(...) at test_output.R:8:0
       2.   └─LEANR:::reduce.graph.fromdata(g, ranking, add.scored.genes, keep.nodes.without.scores)
       3.     ├─base::intersect(V(g)$name, gene.list.char)
       4.     │ ├─base::unique(y[match(as.vector(x), y, 0L)])
       5.     │ └─base::as.vector(x)
       6.     └─igraph::V(g)
       7.       └─igraph::vcount(graph)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# leiden

<details>

* Version: 0.4.3
* GitHub: https://github.com/TomKellyGenetics/leiden
* Source code: https://github.com/cran/leiden
* Date/Publication: 2022-09-10 17:22:53 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "leiden")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      16: test_code(NULL, exprs, env)
      17: source_file(path, child_env(env), wrap = wrap)
      18: FUN(X[[i]], ...)
      19: lapply(test_paths, test_one_file, env = env, wrap = wrap)
      20: doTryCatch(return(expr), name, parentenv, handler)
      21: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      22: tryCatchList(expr, classes, parentenv, handlers)
      23: tryCatch(code, testthat_abort_reporter = function(cnd) {    cat(conditionMessage(cnd), "\n")    NULL})
      24: with_reporter(reporters$multi, lapply(test_paths, test_one_file,     env = env, wrap = wrap))
      25: test_files_serial(test_dir = test_dir, test_package = test_package,     test_paths = test_paths, load_helpers = load_helpers, reporter = reporter,     env = env, stop_on_failure = stop_on_failure, stop_on_warning = stop_on_warning,     wrap = wrap, load_package = load_package)
      26: test_files(test_dir = path, test_paths = test_paths, test_package = package,     reporter = reporter, load_helpers = load_helpers, env = env,     stop_on_failure = stop_on_failure, stop_on_warning = stop_on_warning,     wrap = wrap, load_package = load_package, parallel = parallel)
      27: test_dir("testthat", package = package, reporter = reporter,     ..., load_package = "installed")
      28: test_check("leiden")
      An irrecoverable exception occurred. R is aborting now ...
      Segmentation fault (core dumped)
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘benchmarking.Rmd’ using knitr
    Warning: The closing backticks on line 337 ("```") in benchmarking.Rmd do not match the opening backticks "````" on line 334. You are recommended to fix either the opening or closing delimiter of the code chunk to use exactly the same numbers of backticks and same level of indentation (or blockquote).
    Warning: The closing backticks on line 400 ("```") in benchmarking.Rmd do not match the opening backticks "````" on line 396. You are recommended to fix either the opening or closing delimiter of the code chunk to use exactly the same numbers of backticks and same level of indentation (or blockquote).
    Warning: The closing backticks on line 408 ("```") in benchmarking.Rmd do not match the opening backticks "````" on line 404. You are recommended to fix either the opening or closing delimiter of the code chunk to use exactly the same numbers of backticks and same level of indentation (or blockquote).
    --- finished re-building ‘benchmarking.Rmd’
    
    --- re-building ‘run_bipartite.Rmd’ using knitr
    
     *** caught segfault ***
    ...
      zero-length arrow is of indeterminate angle and so skipped
    Warning in doTryCatch(return(expr), name, parentenv, handler) :
      zero-length arrow is of indeterminate angle and so skipped
    --- finished re-building ‘run_multiplex.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘run_bipartite.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        doc   5.9Mb
    ```

# leidenAlg

<details>

* Version: 1.0.5
* GitHub: https://github.com/kharchenkolab/leidenAlg
* Source code: https://github.com/cran/leidenAlg
* Date/Publication: 2022-09-30 07:20:02 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "leidenAlg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘leidenAlg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.dendrogram.fakeCommunities
    > ### Title: Returns pre-calculated dendrogram
    > ### Aliases: as.dendrogram.fakeCommunities
    > 
    > ### ** Examples
    > 
    > rLeidenComm = suppressWarnings(rleiden.community(exampleGraph, n.cores=1))
    Error in edge_attr_names(graph) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2.   └─igraph::is_weighted(graph)
       3.     ├─"weight" %in% edge_attr_names(graph)
       4.     └─igraph::edge_attr_names(graph)
      ── Error ('test_functions.R:25:2'): membership.fakeCommunities() functionality ──
      Error in `edge_attr_names(graph)`: VECTOR_ELT() can only be applied to a 'list', not a 'environment'
      Backtrace:
          ▆
       1. └─leidenAlg::leiden.community(exampleGraph) at test_functions.R:25:8
       2.   └─igraph::is_weighted(graph)
       3.     ├─"weight" %in% edge_attr_names(graph)
       4.     └─igraph::edge_attr_names(graph)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# leidenbase

<details>

* Version: 0.1.18
* GitHub: https://github.com/cole-trapnell-lab/leidenbase
* Source code: https://github.com/cran/leidenbase
* Date/Publication: 2023-04-15 09:20:02 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "leidenbase")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘leidenbase-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: leiden_find_partition
    > ### Title: Leiden find partition community detection function
    > ### Aliases: leiden_find_partition
    > 
    > ### ** Examples
    > 
    >   library(igraph)
    ...
    
    >   fpath <- system.file( 'testdata', 'igraph_n1500_edgelist.txt.gz', package = 'leidenbase' )
    >   zfp <- gzfile(fpath)
    >   igraph <- read_graph( file = zfp, format='edgelist', n=1500 )
    >   res <- leiden_find_partition(igraph=igraph,
    +                                partition_type='CPMVertexPartition',
    +                                resolution_parameter=1e-5)
    Error in leiden_find_partition(igraph = igraph, partition_type = "CPMVertexPartition",  : 
      REAL() can only be applied to a 'numeric', not a 'NULL'
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `leidenbase::leiden_find_partition(igraph, partition_type = "RBConfigurationVertexPartition", 
          node_sizes = nodsiz, seed = 123456, resolution_parameter = 0.5)`: REAL() can only be applied to a 'numeric', not a 'NULL'
      Backtrace:
          ▆
       1. └─leidenbase::leiden_find_partition(...) at test-leidenbase.R:224:2
      ── Error ('test-leidenbase.R:245:3'): modularity and significance return values ──
      Error in `leidenbase::leiden_find_partition(igraph, partition_type = "CPMVertexPartition", 
          seed = 123456, resolution_parameter = 0.1)`: REAL() can only be applied to a 'numeric', not a 'NULL'
      Backtrace:
          ▆
       1. └─leidenbase::leiden_find_partition(...) at test-leidenbase.R:245:2
      
      [ FAIL 11 | WARN 0 | SKIP 0 | PASS 6 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘leidenbase.Rmd’ using rmarkdown
    Quitting from lines 87-92 (leidenbase.Rmd) 
    Error: processing vignette 'leidenbase.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'NULL'
    --- failed re-building ‘leidenbase.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘leidenbase.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 19.1Mb
      sub-directories of 1Mb or more:
        libs  18.8Mb
    ```

# meconetcomp

<details>

* Version: 0.2.0
* GitHub: https://github.com/ChiLiubio/meconetcomp
* Source code: https://github.com/cran/meconetcomp
* Date/Publication: 2022-10-05 15:20:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "meconetcomp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘meconetcomp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cal_module
    > ### Title: Assign modules to each network
    > ### Aliases: cal_module
    > 
    > ### ** Examples
    > 
    > data(soil_amp_network)
    > soil_amp_network <- cal_module(soil_amp_network)
    Error in is_directed(network_list[[i]]$res_network) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: cal_module -> is_directed
    Execution halted
    ```

# metanetwork

<details>

* Version: 0.7.0
* GitHub: https://github.com/MarcOhlmann/metanetwork
* Source code: https://github.com/cran/metanetwork
* Date/Publication: 2022-12-05 14:10:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "metanetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘metanetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: append_agg_nets
    > ### Title: append aggregated networks
    > ### Aliases: append_agg_nets append_agg_nets.metanetwork
    > 
    > ### ** Examples
    > 
    > library(metanetwork)
    > data(meta_angola)
    > meta_angola = append_agg_nets(meta_angola)
    Error in graph_attr(x, name) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: append_agg_nets ... sapply -> lapply -> FUN -> $ -> $.igraph -> graph_attr
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `graph_attr(x, name)`: VECTOR_ELT() can only be applied to a 'list', not a 'environment'
      Backtrace:
          ▆
       1. ├─testthat::expect_is(...) at test-vismetaNetwork.R:34:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─metanetwork::diff_plot(...)
       5.   ├─c(g1$name, g2$name) %in% ...
       6.   ├─g1$name
       7.   └─igraph:::`$.igraph`(g1, "name")
       8.     └─igraph::graph_attr(x, name)
      
      [ FAIL 16 | WARN 8 | SKIP 0 | PASS 32 ]
      Error: Test failures
      Execution halted
    ```

# migraph

<details>

* Version: 0.13.2
* GitHub: https://github.com/snlab-ch/migraph
* Source code: https://github.com/cran/migraph
* Date/Publication: 2022-12-20 16:20:02 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "migraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘migraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add
    > ### Title: Adding and copying attributes from one graph to another
    > ### Aliases: add add_node_attribute add_tie_attribute copy_node_attributes
    > ###   join_ties
    > 
    > ### ** Examples
    > 
    > add_node_attribute(mpn_elite_mex, "wealth", 1:35)
    Error in igraph::vcount(as_igraph(object)) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: add_node_attribute -> network_nodes -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       8.         └─igraph::vertex_attr_names(graph)
      ── Error ('test-viz_layout_partition.R:20:3'): concentric layout works ─────────
      Error in `vertex_attr_names(graph)`: VECTOR_ELT() can only be applied to a 'list', not a 'environment'
      Backtrace:
          ▆
       1. └─migraph::layout_tbl_graph_concentric(ison_southern_women) at test-viz_layout_partition.R:20:2
       2.   ├─migraph::is_twomode(object)
       3.   └─migraph:::is_twomode.igraph(object)
       4.     └─igraph::is.bipartite(object)
       5.       ├─"type" %in% vertex_attr_names(graph)
       6.       └─igraph::vertex_attr_names(graph)
      
      [ FAIL 74 | WARN 0 | SKIP 0 | PASS 99 ]
      Error: Test failures
      Execution halted
    ```

# missSBM

<details>

* Version: 1.0.3
* GitHub: https://github.com/grossSBM/missSBM
* Source code: https://github.com/cran/missSBM
* Date/Publication: 2022-08-23 12:10:06 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "missSBM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘missSBM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: frenchblog2007
    > ### Title: Political Blogosphere network prior to 2007 French presidential
    > ###   election
    > ### Aliases: frenchblog2007
    > ### Keywords: datasets
    > 
    > ### ** Examples
    ...
    > 
    > data(frenchblog2007)
    > igraph::V(frenchblog2007)$party
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: <Anonymous> -> vcount
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 396 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-consistency-on-fully-observed-network.R:9:3'): SimpleSBM_fit_missSBM and missSBMfit are coherent ──
      Error in `vcount(graph)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. ├─war$belligerent %>% igraph::as_adj() at test-consistency-on-fully-observed-network.R:9:2
       2. └─igraph::as_adj(.)
       3.   └─igraph:::get.adjacency.sparse(...)
       4.     └─igraph::vcount(graph)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 396 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘case_study_war_networks.Rmd’ using rmarkdown
    Quitting from lines 60-65 (case_study_war_networks.Rmd) 
    Error: processing vignette 'case_study_war_networks.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘case_study_war_networks.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘case_study_war_networks.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.6Mb
      sub-directories of 1Mb or more:
        libs   8.6Mb
    ```

# molnet

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/molnet
* Date/Publication: 2021-08-06 08:30:02 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "molnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘molnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: determine_drug_targets
    > ### Title: Determine drug target nodes in network
    > ### Aliases: determine_drug_targets
    > 
    > ### ** Examples
    > 
    > data(drug_gene_interactions)
    ...
    + combined_graphs[["annotations"]],
    + drug_target_interaction,
    + settings)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: determine_drug_targets -> find_targets -> %in% -> <Anonymous> -> vcount
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Molnet_Vignette.Rmd’ using rmarkdown
    Quitting from lines 310-312 (Molnet_Vignette.Rmd) 
    Error: processing vignette 'Molnet_Vignette.Rmd' failed with diagnostics:
    VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    --- failed re-building ‘Molnet_Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Molnet_Vignette.Rmd’
    
    Error: Vignette re-building failed.
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
    
    > ### Name: directed_dummy_net
    > ### Title: Two-level directed network dummy example
    > ### Aliases: directed_dummy_net
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > plot_mnet(directed_dummy_net)
    Error in vertex.attributes(graph) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: plot_mnet ... node_tibble -> as_tibble -> vertex_attr -> vertex.attributes
    Execution halted
    ```

# multinets

<details>

* Version: 0.2.2
* GitHub: https://github.com/neylsoncrepalde/multinets
* Source code: https://github.com/cran/multinets
* Date/Publication: 2019-12-14 17:20:03 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "multinets")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multinets-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: extract_highlevel
    > ### Title: Extract the high level of a multilevel network
    > ### Aliases: extract_highlevel
    > 
    > ### ** Examples
    > 
    > organizations <- extract_highlevel(linked_sim)
    Error in vertex_attr_names(graph) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: extract_highlevel ... is_multilevel -> <Anonymous> -> %in% -> vertex_attr_names
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11.     └─igraph::is_bipartite(x)
       12.       ├─"type" %in% vertex_attr_names(graph)
       13.       └─igraph::vertex_attr_names(graph)
      ── Error ('test-mode_transformation.R:15:3'): mode transformation works without specifying 'which' ──
      Error in `vertex_attr_names(graph)`: VECTOR_ELT() can only be applied to a 'list', not a 'environment'
      Backtrace:
          ▆
       1. └─igraph::bipartite_projection(g.bip) at test-mode_transformation.R:15:2
       2.   └─igraph:::handle_vertex_type_arg(types, graph)
       3.     ├─"type" %in% vertex_attr_names(graph)
       4.     └─igraph::vertex_attr_names(graph)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

# mwcsr

<details>

* Version: 0.1.6
* GitHub: https://github.com/ctlab/mwcsr
* Source code: https://github.com/cran/mwcsr
* Date/Publication: 2022-07-12 17:50:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "mwcsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mwcsr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_instance_type
    > ### Title: Check the type and the validity of an MWCS instance
    > ### Aliases: get_instance_type
    > 
    > ### ** Examples
    > 
    > data(mwcs_example)
    > get_instance_type(mwcs_example)
    Error in igraph::is_directed(g) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: get_instance_type -> check_graph -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─mwcsr::solve_mwcsp(solver, sgmwcs_small_instance) at test_virgo.R:48:4
       2.   └─mwcsr:::check_graph(instance)
       3.     └─igraph::is_directed(g)
      ── Error ('test_virgo.R:80:5'): heuristic virgo_solver works on SGMWCS ─────────
      Error in `graph_attr(x, name)`: VECTOR_ELT() can only be applied to a 'list', not a 'environment'
      Backtrace:
          ▆
       1. ├─si$signals at test_virgo.R:80:4
       2. └─igraph:::`$.igraph`(si, signals) at test_virgo.R:80:4
       3.   └─igraph::graph_attr(x, name)
      
      [ FAIL 9 | WARN 1 | SKIP 6 | PASS 30 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    Quitting from lines 43-46 (tutorial.Rmd) 
    Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 17.4Mb
      sub-directories of 1Mb or more:
        java   2.5Mb
        libs  14.2Mb
    ```

# nda

<details>

* Version: 0.1.6
* GitHub: https://github.com/kzst/nda
* Source code: https://github.com/cran/nda
* Date/Publication: 2022-10-14 13:10:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "nda")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nda-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: biplot.nda
    > ### Title: Biplot function for Network-based Dimensionality Reduction and
    > ###   Analysis (NDA)
    > ### Aliases: biplot.nda
    > ### Keywords: plot
    > 
    > ### ** Examples
    ...
    > 
    > # Biplot function without feature selection
    > 
    > data("CrimesUSA1990.X")
    > df<-CrimesUSA1990.X
    > p<-ndr(df)
    Error in find_partition(graph, igraph::E(graph)$weight, resolution, n.iterations) : 
      REAL() can only be applied to a 'numeric', not a 'NULL'
    Calls: ndr -> <Anonymous> -> find_partition
    Execution halted
    ```

# netplot

<details>

* Version: 0.1-1
* GitHub: https://github.com/USCCANA/netplot
* Source code: https://github.com/cran/netplot
* Date/Publication: 2021-06-16 07:10:02 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "netplot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netplot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_colors
    > ### Title: Create a vector of colors for vertices and edges
    > ### Aliases: make_colors make_edges_colors make_vertex_colors
    > 
    > ### ** Examples
    > 
    > 
    > data(UKfaculty, package="igraphdata")
    > col <- make_vertex_colors(UKfaculty, "Group")
    Error in igraph::vertex_attr(x, attr) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: make_vertex_colors -> get_vertex_attr -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘base-and-grid.Rmd’ using rmarkdown
    --- finished re-building ‘base-and-grid.Rmd’
    
    --- re-building ‘examples.Rmd’ using rmarkdown
    Quitting from lines 32-43 (examples.Rmd) 
    Error: processing vignette 'examples.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘examples.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘examples.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# netrankr

<details>

* Version: 1.2.0
* GitHub: https://github.com/schochastics/netrankr
* Source code: https://github.com/cran/netrankr
* Date/Publication: 2022-09-26 21:00:02 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "netrankr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netrankr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: aggregate_positions
    > ### Title: Quantification of (indirect) relations
    > ### Aliases: aggregate_positions
    > 
    > ### ** Examples
    > 
    > library(igraph)
    ...
    > 
    > data("dbces11")
    > # degree
    > dbces11 %>%
    +   indirect_relations(type = "adjacency") %>%
    +   aggregate_positions(type = "sum")
    Error in igraph::is_directed(g) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: %>% ... aggregate_positions -> indirect_relations -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_dominance.R:11:3'): neighborhood-inclusion is correct ──────────
      Error in `igraph::is_directed(g)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test_dominance.R:11:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─netrankr::neighborhood_inclusion(dbces11, sparse = FALSE)
       5.   └─igraph::is_directed(g)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 78 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘benchmarks.Rmd’ using rmarkdown
    --- finished re-building ‘benchmarks.Rmd’
    
    --- re-building ‘centrality_indices.Rmd’ using rmarkdown
    --- finished re-building ‘centrality_indices.Rmd’
    
    --- re-building ‘indirect_relations.Rmd’ using rmarkdown
    Quitting from lines 61-79 (indirect_relations.Rmd) 
    Error: processing vignette 'indirect_relations.Rmd' failed with diagnostics:
    ...
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘use_case.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘indirect_relations.Rmd’ ‘neighborhood_inclusion.Rmd’
      ‘partial_centrality.Rmd’ ‘positional_dominance.Rmd’
      ‘probabilistic_cent.Rmd’ ‘threshold_graph.Rmd’ ‘use_case.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.5Mb
      sub-directories of 1Mb or more:
        doc    1.6Mb
        libs  10.6Mb
    ```

# netseg

<details>

* Version: 1.0-1
* GitHub: https://github.com/mbojan/netseg
* Source code: https://github.com/cran/netseg
* Date/Publication: 2022-08-25 12:10:06 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "netseg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netseg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EF3
    > ### Title: Example data from Figure III of Echenique and Fryer (2006)
    > ### Aliases: EF3
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    ...
    +     vertex.color = igraph::V(EF3)$type+1,
    +     vertex.label.family = "",
    +     sub = "Source: Echenique & Fryer (2006)",
    +     main = "Neighborhood racial segregation\n in a fictional city"
    +   )
    + }
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: plot -> plot.igraph -> vcount
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. ├─netseg::smi(as.directed(WhiteKinship), "gender")
       10. └─igraph::as.directed(WhiteKinship)
      ── Error ('test-ssi.R:4:3'): values of ssi for EF3 data correspond to values from the paper ──
      Error in `igraph::is.directed(g)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. └─netseg::ssi(EF3, "race") at test-ssi.R:4:2
       2.   ├─base::stopifnot(!igraph::is.directed(g), !igraph::any_multiple(g))
       3.   └─igraph::is.directed(g)
      
      [ FAIL 15 | WARN 0 | SKIP 0 | PASS 59 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘netseg.Rmd’ using rmarkdown
    Quitting from lines 46-47 (netseg.Rmd) 
    Error: processing vignette 'netseg.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘netseg.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘netseg.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# nett

<details>

* Version: 1.0.0
* GitHub: https://github.com/aaamini/nett
* Source code: https://github.com/cran/nett
* Date/Publication: 2022-11-09 10:50:05 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "nett")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nett-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fast_cpl
    > ### Title: CPL algorithm for community detection (fast)
    > ### Aliases: fast_cpl
    > ### Keywords: comm_detect
    > 
    > ### ** Examples
    > 
    > head(fast_cpl(igraph::as_adj(polblogs), 2), 50)
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: head ... spec_repr -> <Anonymous> -> get.adjacency.sparse -> vcount
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Community_Detection.Rmd’ using rmarkdown
    --- finished re-building ‘Community_Detection.Rmd’
    
    --- re-building ‘Visualization.Rmd’ using rmarkdown
    Quitting from lines 99-105 (Visualization.Rmd) 
    Error: processing vignette 'Visualization.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘Visualization.Rmd’
    ...
    --- finished re-building ‘explore-comm.Rmd’
    
    --- re-building ‘hard_dcsbm_testing.Rmd’ using rmarkdown
    --- finished re-building ‘hard_dcsbm_testing.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Visualization.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# poppr

<details>

* Version: 2.9.4
* GitHub: https://github.com/grunwaldlab/poppr
* Source code: https://github.com/cran/poppr
* Date/Publication: 2023-03-23 03:20:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "poppr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-msn.R:445:3'): Minimum spanning networks can subset populations ──
      ucl(bmsn) not identical to ucl(pmsn).
      Component 10: Component 3: 1 string mismatch
      ── Failure ('test-msn.R:449:3'): Minimum spanning networks can subset populations ──
      ucl(bmsn12) not identical to ucl(pmsn12).
      Component 10: Component 3: 1 string mismatch
      ── Failure ('test-msn.R:453:3'): Minimum spanning networks can subset populations ──
      ucl(bmsn1) not identical to ucl(pmsn1).
      Component 10: Component 3: 1 string mismatch
      
      [ FAIL 3 | WARN 0 | SKIP 181 | PASS 375 ]
      Error: Test failures
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
    ...
    l.270 \long
               \def\@secondoffive#1#2#3#4#5{#2}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘algo.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘algo.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# psSubpathway

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/psSubpathway
* Date/Publication: 2019-10-02 12:40:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "psSubpathway")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘psSubpathway-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotSpwNetmap
    > ### Title: Polt a subpathway network map
    > ### Aliases: plotSpwNetmap
    > 
    > ### ** Examples
    > 
    > # load depend package.
    ...
    The following object is masked from ‘package:base’:
    
        union
    
    > # plot network graph of the subpathway 00982_2
    > plotSpwNetmap(spwid="00982_2",layout=layout_nicely)
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: plotSpwNetmap -> plot -> plot.igraph -> vcount
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘vignette.Rmd’ using rmarkdown
    Quitting from lines 173-178 (vignette.Rmd) 
    Error: processing vignette 'vignette.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rmonad

<details>

* Version: 0.7.0
* GitHub: https://github.com/arendsee/rmonad
* Source code: https://github.com/cran/rmonad
* Date/Publication: 2020-02-14 07:00:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "rmonad")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rmonad-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: missues
    > ### Title: Tabulates all errors, warnings and notes
    > ### Aliases: missues
    > 
    > ### ** Examples
    > 
    > data(gff)
    > m <- gff$good_result
    > missues(m)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: missues ... .process_tag_and_index -> .get_ids -> <Anonymous> -> vcount
    Execution halted
    ```

# rsetse

<details>

* Version: 0.5.0
* GitHub: https://github.com/JonnoB/rSETSe
* Source code: https://github.com/cran/rsetse
* Date/Publication: 2021-06-11 10:00:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "rsetse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rsetse-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calc_tension_strain_hd
    > ### Title: Calculate line tension and strain from the topology and node
    > ###   embeddings for high dimensional feature networks
    > ### Aliases: calc_tension_strain_hd
    > 
    > ### ** Examples
    > 
    ...
    > g <- biconnected_network %>%
    +  prepare_edges(., k = 1000) %>%
    +  #prepare the continuous features as normal
    +  prepare_continuous_force(., node_names = "name", force_var = "force") %>%
    +  #prepare the categorical features as normal
    +  prepare_categorical_force(., node_names = "name", force_var = "group")
    Error in igraph::as_data_frame(g, what = "both") : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: %>% ... prepare_continuous_force -> prepare_edges -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Categorical-and-continuous-features.Rmd’ using rmarkdown
    Quitting from lines 31-35 (Categorical-and-continuous-features.Rmd) 
    Error: processing vignette 'Categorical-and-continuous-features.Rmd' failed with diagnostics:
    VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    --- failed re-building ‘Categorical-and-continuous-features.Rmd’
    
    --- re-building ‘separate-peels-quintet.Rmd’ using rmarkdown
    --- finished re-building ‘separate-peels-quintet.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Categorical-and-continuous-features.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rSpectral

<details>

* Version: 1.0.0.10
* GitHub: https://github.com/cmclean5/rSpectral
* Source code: https://github.com/cran/rSpectral
* Date/Publication: 2023-01-18 12:00:02 UTC
* Number of recursive dependencies: 44

Run `revdepcheck::cloud_details(, "rSpectral")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rSpectral-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: spectral_igraph_communities
    > ### Title: Spectral clustering for 'igraph' objects
    > ### Aliases: spectral_igraph_communities
    > 
    > ### ** Examples
    > 
    > data(karate,package='igraphdata')
    > c<-spectral_igraph_communities(karate)
    Error in matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: spectral_igraph_communities ... spectral_igraph_membership -> as.data.frame -> <Anonymous> -> matrix
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.     └─igraph::get.edgelist(g, names = TRUE)
       5.       └─base::matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2)
      ── Error ('test-igraph.R:24:3'): membership fix_neig=1 is correct ──────────────
      Error in `matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. └─rSpectral::spectral_igraph_communities(karate, fix_neig = 1) at test-igraph.R:24:2
       2.   └─rSpectral::spectral_igraph_membership(...)
       3.     ├─base::as.data.frame(igraph::get.edgelist(g, names = TRUE))
       4.     └─igraph::get.edgelist(g, names = TRUE)
       5.       └─base::matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 4 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        libs   5.2Mb
    ```

# sbm

<details>

* Version: 0.4.5
* GitHub: https://github.com/GrossSBM/sbm
* Source code: https://github.com/cran/sbm
* Date/Publication: 2023-01-09 10:30:02 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "sbm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sbm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: war
    > ### Title: War data set
    > ### Aliases: war
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(war)
    > class(war$belligerent)
    [1] "igraph"
    > igraph::gorder(war$alliance)
    Error in igraph::gorder(war$alliance) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Multipartite_EcologicalNetwork.Rmd’ using rmarkdown
    --- finished re-building ‘Multipartite_EcologicalNetwork.Rmd’
    
    --- re-building ‘MultiplexNetwork_principle.Rmd’ using rmarkdown
    --- finished re-building ‘MultiplexNetwork_principle.Rmd’
    
    --- re-building ‘Multiplex_allianceNwar_case_study.Rmd’ using rmarkdown
    Quitting from lines 56-59 (Multiplex_allianceNwar_case_study.Rmd) 
    ...
    --- failed re-building ‘Multiplex_allianceNwar_case_study.Rmd’
    
    --- re-building ‘SBM_fungus_tree_network.Rmd’ using rmarkdown
    --- finished re-building ‘SBM_fungus_tree_network.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Multiplex_allianceNwar_case_study.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sccore

<details>

* Version: 1.0.3
* GitHub: https://github.com/kharchenkolab/sccore
* Source code: https://github.com/cran/sccore
* Date/Publication: 2023-03-13 00:00:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "sccore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sccore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graphToAdjList
    > ### Title: Convert igraph graph into an adjacency list
    > ### Aliases: graphToAdjList
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > edge.list.fact <- igraph::as_edgelist(conosGraph) %>% as_factor()
    Error in matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: %>% -> as_factor -> <Anonymous> -> matrix
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2. ├─sccore::as_factor(.)
       3. └─igraph::as_edgelist(conosGraph)
       4.   └─base::matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2)
      ── Error ('test_helpers.R:43:2'): graphToAdjList() functionality ───────────────
      Error in `matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. ├─igraph::as_edgelist(conosGraph) %>% as_factor() at test_helpers.R:43:8
       2. ├─sccore::as_factor(.)
       3. └─igraph::as_edgelist(conosGraph)
       4.   └─base::matrix(.Call(R_igraph_get_edgelist, graph, TRUE), ncol = 2)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        libs   7.1Mb
    ```

# ScorePlus

<details>

* Version: 0.1
* GitHub: NA
* Source code: https://github.com/cran/ScorePlus
* Date/Publication: 2019-06-14 08:40:03 UTC
* Number of recursive dependencies: 16

Run `revdepcheck::cloud_details(, "ScorePlus")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ScorePlus-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: SCORE
    > ### Title: community detection method called SCORE Spectral Clustering On
    > ###   Ratios-of-Eigenvectors (SCORE)
    > ### Aliases: SCORE
    > 
    > ### ** Examples
    > 
    ...
    The following object is masked from ‘package:base’:
    
        union
    
    > data('karate')
    > A = get.adjacency(karate)
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: get.adjacency -> get.adjacency.sparse -> vcount
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# secrlinear

<details>

* Version: 1.1.4
* GitHub: NA
* Source code: https://github.com/cran/secrlinear
* Date/Publication: 2021-05-04 04:50:05 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "secrlinear")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘secrlinear-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Arvicola
    > ### Title: Water Vole Capture Dataset
    > ### Aliases: arvicola
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    ...
    > 
    > ## for speed, pre-compute distance matrix
    > userd <- networkdistance (traps(arvicola), glymemask, glymemask)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: networkdistance -> cbind -> V -> vcount
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘secrlinear-vignette.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
    ...
    
    Error: processing vignette 'secrlinear-vignette.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/secrlinear/new/secrlinear.Rcheck/vign_test/secrlinear/vignettes/secrlinear-vignette.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See secrlinear-vignette.log for more info.
    --- failed re-building ‘secrlinear-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘secrlinear-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# shazam

<details>

* Version: 1.1.2
* GitHub: NA
* Source code: https://github.com/cran/shazam
* Date/Publication: 2022-10-01 07:30:02 UTC
* Number of recursive dependencies: 124

Run `revdepcheck::cloud_details(, "shazam")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘shazam-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: makeGraphDf
    > ### Title: Build a data.frame from a ChangeoClone and an igraph object
    > ###   containing a clonal lineage
    > ### Aliases: makeGraphDf
    > 
    > ### ** Examples
    > 
    > # Load and subset example data
    > data(ExampleDb, package = "alakazam")
    > data(ExampleTrees, package = "alakazam")
    > graph <- ExampleTrees[[17]]
    > db <- subset(ExampleDb, clone_id == graph$clone)
    Error in graph_attr(x, name) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: subset ... subset.data.frame -> eval -> eval -> $ -> $.igraph -> graph_attr
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Baseline-Vignette.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/grffile.sty'' had status 1
    ...
    LaTeX failed to compile /tmp/workdir/shazam/new/shazam.Rcheck/vign_test/shazam/vignettes/Targeting-Vignette.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See Targeting-Vignette.log for more info.
    --- failed re-building ‘Targeting-Vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Baseline-Vignette.Rmd’ ‘DistToNearest-Vignette.Rmd’
      ‘Mutation-Vignette.Rmd’ ‘Shmulate-Vignette.Rmd’
      ‘Targeting-Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sigmajs

<details>

* Version: 0.1.5
* GitHub: https://github.com/JohnCoene/sigmajs
* Source code: https://github.com/cran/sigmajs
* Date/Publication: 2020-06-18 18:10:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "sigmajs")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("sigmajs")
      Found # 4 clusters
      [ FAIL 1 | WARN 8 | SKIP 0 | PASS 64 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-formats.R:21:3'): igraph ───────────────────────────────────────
      Error in `vcount(graph)`: REAL() can only be applied to a 'numeric', not a 'logical'
      Backtrace:
          ▆
       1. └─igraph::layout_with_fr(lesmis_igraph) at test-formats.R:21:2
       2.   └─igraph::vcount(graph)
      
      [ FAIL 1 | WARN 8 | SKIP 0 | PASS 64 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 28 marked UTF-8 strings
    ```

# signnet

<details>

* Version: 1.0.1
* GitHub: https://github.com/schochastics/signnet
* Source code: https://github.com/cran/signnet
* Date/Publication: 2023-01-27 13:40:02 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "signnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘signnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: eigen_centrality_signed
    > ### Title: Signed Eigenvector centrality
    > ### Aliases: eigen_centrality_signed
    > 
    > ### ** Examples
    > 
    > library(igraph)
    ...
    The following object is masked from ‘package:base’:
    
        union
    
    > data("tribes")
    > eigen_centrality_signed(tribes)
    Error in igraph::edge_attr_names(g) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: eigen_centrality_signed -> is_signed -> %in% -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2.   └─signnet::is_signed(g)
       3.     ├─"sign" %in% igraph::edge_attr_names(g)
       4.     └─igraph::edge_attr_names(g)
      ── Error ('test-blockmodel.R:25:3'): general blockmodeling works ───────────────
      Error in `igraph::edge_attr_names(g)`: VECTOR_ELT() can only be applied to a 'list', not a 'environment'
      Backtrace:
          ▆
       1. └─signnet::signed_blockmodel_general(...) at test-blockmodel.R:25:2
       2.   └─signnet::is_signed(g)
       3.     ├─"sign" %in% igraph::edge_attr_names(g)
       4.     └─igraph::edge_attr_names(g)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 86 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘blockmodeling.Rmd’ using rmarkdown
    Quitting from lines 56-61 (blockmodeling.Rmd) 
    Error: processing vignette 'blockmodeling.Rmd' failed with diagnostics:
    VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    --- failed re-building ‘blockmodeling.Rmd’
    
    --- re-building ‘centrality.Rmd’ using rmarkdown
    --- finished re-building ‘centrality.Rmd’
    
    ...
    Quitting from lines 79-83 (structural_balance.Rmd) 
    Error: processing vignette 'structural_balance.Rmd' failed with diagnostics:
    VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    --- failed re-building ‘structural_balance.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘blockmodeling.Rmd’ ‘signed_networks.Rmd’ ‘structural_balance.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.7Mb
      sub-directories of 1Mb or more:
        libs   6.1Mb
    ```

# SNscan

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/SNscan
* Date/Publication: 2016-01-19 13:09:28
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "SNscan")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SNscan-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network.scan
    > ### Title: Network Scan Statistic
    > ### Aliases: network.scan
    > ### Keywords: scanning method
    > 
    > ### ** Examples
    > 
    > data(karate)
    > 
    > ks=network.scan(g=karate,radius=3,attribute=NULL,
    + 	model="pois.stat",pattern="structure")	
    Error in is_directed(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: network.scan -> shortest.paths -> is_directed
    Execution halted
    ```

# SOMbrero

<details>

* Version: 1.4-1
* GitHub: https://github.com/tuxette/sombrero
* Source code: https://github.com/cran/SOMbrero
* Date/Publication: 2022-01-03 17:10:08 UTC
* Number of recursive dependencies: 110

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
    Error in gorder(init.graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: projectIGraph -> projectIGraph.somRes -> gorder
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘a-doc-SOMbrero-package.Rmd’ using knitr
    --- finished re-building ‘a-doc-SOMbrero-package.Rmd’
    
    --- re-building ‘b-doc-grids.Rmd’ using knitr
    --- finished re-building ‘b-doc-grids.Rmd’
    
    --- re-building ‘c-doc-numericSOM.Rmd’ using knitr
    Warning in wordcloud_boxes(data_points = points_valid_first, boxes = boxes,  :
      Some words could not fit on page. They have been placed at their original positions.
    ...
    Quitting from lines 41-100 (e-doc-relationalSOM.Rmd) 
    Error: processing vignette 'e-doc-relationalSOM.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘e-doc-relationalSOM.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘e-doc-relationalSOM.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# spreadr

<details>

* Version: 0.2.0
* GitHub: NA
* Source code: https://github.com/cran/spreadr
* Date/Publication: 2021-05-11 06:50:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "spreadr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘spreadr_vignette.Rmd’ using rmarkdown
    Quitting from lines 78-81 (spreadr_vignette.Rmd) 
    Error: processing vignette 'spreadr_vignette.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘spreadr_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘spreadr_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘extrafont’ ‘ggplot2’
      All declared Imports should be used.
    ```

# SubpathwayLNCE

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/SubpathwayLNCE
* Date/Publication: 2016-01-19 08:17:59
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "SubpathwayLNCE")` for more info

</details>

## Newly broken

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘SubpathwayLNCE.Rnw’
      ...
    
    > g2 <- GetExampleData(exampleData = "g2")
    
    > LncGenePairs <- GetExampleData(exampleData = "LncGenePairs")
    
    > interUMGraph <- getInteGraphList(g2[42:45], LncGenePairs)
    
      When sourcing ‘SubpathwayLNCE.R’:
    Error: REAL() can only be applied to a 'numeric', not a 'logical'
    Execution halted
    
      ‘SubpathwayLNCE.Rnw’... failed
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘SubpathwayLNCE.Rnw’ using Sweave
    Loading required package: igraph
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    ...
    Error in vcount(graphList[[t]]) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    
    --- failed re-building ‘SubpathwayLNCE.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘SubpathwayLNCE.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# SubtypeDrug

<details>

* Version: 0.1.5
* GitHub: https://github.com/hanjunwei-lab/SubtypeDrug
* Source code: https://github.com/cran/SubtypeDrug
* Date/Publication: 2021-05-17 08:50:03 UTC
* Number of recursive dependencies: 126

Run `revdepcheck::cloud_details(, "SubtypeDrug")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SubtypeDrug-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotSpwNetGraph
    > ### Title: Polt a subpathway network graph
    > ### Aliases: plotSpwNetGraph
    > 
    > ### ** Examples
    > 
    > require(igraph)
    ...
    The following object is masked from ‘package:base’:
    
        union
    
    > # plot network graph of the subpathway 00020_4.
    > plotSpwNetGraph(spwid="00020_4")
    Error in vcount(graph) : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: plotSpwNetGraph -> plot -> plot.igraph -> vcount
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘vignette.Rmd’ using rmarkdown
    Quitting from lines 182-185 (vignette.Rmd) 
    Error: processing vignette 'vignette.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tgver

<details>

* Version: 0.3.0
* GitHub: https://github.com/tgve/tgver
* Source code: https://github.com/cran/tgver
* Date/Publication: 2022-09-30 15:20:03 UTC
* Number of recursive dependencies: 157

Run `revdepcheck::cloud_details(, "tgver")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘dev-plan.Rmd’ using rmarkdown
    --- finished re-building ‘dev-plan.Rmd’
    
    --- re-building ‘r-and-js.Rmd’ using rmarkdown
    Quitting from lines 31-67 (r-and-js.Rmd) 
    Error: processing vignette 'r-and-js.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'logical'
    --- failed re-building ‘r-and-js.Rmd’
    
    --- re-building ‘tgver.Rmd’ using rmarkdown
    --- finished re-building ‘tgver.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘r-and-js.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# threejs

<details>

* Version: 0.3.3
* GitHub: https://github.com/bwlewis/rthreejs
* Source code: https://github.com/cran/threejs
* Date/Publication: 2020-01-21 15:50:03 UTC
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "threejs")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘threejs-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graphjs
    > ### Title: Interactive 3D Graph Visualization
    > ### Aliases: graphjs
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    ...
    > l3 = light_ambient(color = "#555555")
    > (graphjs(g, vertex.color="gray", vertex.shape="sphere", lights=list(l1, l2, l3)))
    > 
    > # Les Miserables Character Co-appearance Data
    > data("LeMis")
    > (graphjs(LeMis))
    Error in adjacent_vertices(x, i, mode = if (directed) "out" else "all") : 
      REAL() can only be applied to a 'numeric', not a 'logical'
    Calls: graphjs -> [[ -> [[.igraph -> adjacent_vertices
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘threejs.R’
    Running the tests in ‘tests/threejs.R’ failed.
    Last 13 lines of output:
      > frequent_destinations <- names(freq)[1:10]
      > idx <- dest %in% frequent_destinations
      > frequent_flights <- flights[idx, ]
      > ll <- unique(frequent_flights[, 3:4])
      > globejs(lat=ll[, 1], long=ll[, 2], arcs=frequent_flights,
      +         arcsHeight=0.3, arcsLwd=2, arcsColor="#ffff00", arcsOpacity=0.15,
      +         atmosphere=TRUE, color="#00aaff", pointsize=0.5)
      > 
      > # graphs
      > data(LeMis, package="threejs")
      > g <- graphjs(LeMis, main="Les Mis&eacute;rables")
      Error in adjacent_vertices(x, i, mode = if (directed) "out" else "all") : 
        REAL() can only be applied to a 'numeric', not a 'logical'
      Calls: graphjs -> [[ -> [[.igraph -> adjacent_vertices
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘shiny’
    ```

# tosr

<details>

* Version: 0.1.2
* GitHub: https://github.com/coreofscience/tosr
* Source code: https://github.com/cran/tosr
* Date/Publication: 2023-01-13 23:50:02 UTC
* Number of recursive dependencies: 182

Run `revdepcheck::cloud_details(, "tosr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_equal(...) at test-tosr_load.R:4:2
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─base::nrow(tosSAP(my_tosr_load$graph, my_tosr_load$df, my_tosr_load$nodes))
        5. ├─tosr::tosSAP(my_tosr_load$graph, my_tosr_load$df, my_tosr_load$nodes)
        6. │ └─tibble::tibble(...)
        7. │   └─tibble:::tibble_quos(xs, .rows, .name_repair)
        8. │     └─rlang::eval_tidy(xs[[j]], mask)
        9. └─igraph::V(graph)
       10.   └─igraph::vcount(graph)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# webSDM

<details>

* Version: 1.1-3
* GitHub: https://github.com/giopogg/webSDM
* Source code: https://github.com/cran/webSDM
* Date/Publication: 2023-03-14 13:50:02 UTC
* Number of recursive dependencies: 190

Run `revdepcheck::cloud_details(, "webSDM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘webSDM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: SDMfit
    > ### Title: Fitting a single-species SDM
    > ### Aliases: SDMfit
    > 
    > ### ** Examples
    > 
    > data(Y,X,G)
    > # Run a local model (i.e. a SDM) for species Y6
    > mySDM = SDMfit("Y6", Y, X, G, "~X_1 + X_2", mode = "prey",
    +        method = "stan_glm", family = binomial(link = "logit"))
    Error in vertex_attr_names(graph) : 
      VECTOR_ELT() can only be applied to a 'list', not a 'environment'
    Calls: SDMfit ... neighbors -> as.igraph.vs -> %in% -> vertex_attr_names
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Matrix’
      All declared Imports should be used.
    ```

