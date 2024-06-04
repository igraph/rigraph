# CoNI

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/CoNI
* Date/Publication: 2021-09-30 09:10:02 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "CoNI")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CoNI-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: NetStats
    > ### Title: Network Statistics
    > ### Aliases: NetStats
    > 
    > ### ** Examples
    > 
    > #Load color nodes table
    > data(MetColorTable)
    > #Assign colors according to "Class" column
    > MetColorTable<-assign_colorsAnnotation(MetColorTable)
    > #Load CoNI results
    > data(CoNIResultsHFDToy)
    > 
    > #Generate Network
    > HFDNetwork<-generate_network(ResultsCoNI = CoNIResultsHFDToy,
    +                              colorVertexNetwork = TRUE,
    +                              colorVertexTable = MetColorTable,
    +                              outputDir = "./",
    +                              outputFileName = "HFD",
    +                              saveFiles = FALSE)
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: generate_network ... hub_score -> hits_scores -> hub_and_authority_scores_impl
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘Full_RunCoNI.Rmd’
      ...
    > MetaboliteAnnotation <- assign_colorsAnnotation(MetaboliteAnnotation, 
    +     col = "Class")
    
    > ChowNetwork <- generate_network(ResultsCoNI = CoNIResults_Chow, 
    +     colorVertexTable = MetaboliteAnnotation, outputDir = "./", 
    +     outputFileN .... [TRUNCATED] 
    
      When sourcing ‘Full_RunCoNI.R’:
    Error: attempt to set an attribute on NULL
    Execution halted
    
      ‘Full_RunCoNI.Rmd’ using ‘UTF-8’... failed
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Full_RunCoNI.Rmd’ using rmarkdown
    
    Quitting from lines 133-138 [network_chow] (Full_RunCoNI.Rmd)
    Error: processing vignette 'Full_RunCoNI.Rmd' failed with diagnostics:
    attempt to set an attribute on NULL
    --- failed re-building ‘Full_RunCoNI.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Full_RunCoNI.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# degreenet

<details>

* Version: 1.3-5
* GitHub: NA
* Source code: https://github.com/cran/degreenet
* Date/Publication: 2024-02-01 08:00:05 UTC
* Number of recursive dependencies: 18

Run `revdepcheck::cloud_details(, "degreenet")` for more info

</details>

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
    
    > ### Name: get_authority_centrality
    > ### Title: Get the authority scores for all nodes
    > ### Aliases: get_authority_centrality
    > 
    > ### ** Examples
    > 
    > # Create a random graph using the
    > # `add_gnm_graph()` function
    > graph <-
    +   create_graph() %>%
    +   add_gnm_graph(
    +     n = 10,
    +     m = 15,
    +     set_seed = 23)
    > 
    > # Get the authority centrality scores
    > # for all nodes in the graph
    > graph %>%
    +   get_authority_centrality()
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: %>% ... <Anonymous> -> hits_scores -> hub_and_authority_scores_impl
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
      [ FAIL 1 | WARN 1 | SKIP 24 | PASS 1686 ]
      
      ══ Skipped tests (24) ══════════════════════════════════════════════════════════
      • On CRAN (24): 'test-add_forward_reverse_edges.R:94:3',
        'test-add_graphs.R:41:3', 'test-add_graphs.R:262:3',
        'test-add_graphs.R:1787:3', 'test-add_nodes_edges_from_table.R:684:3',
        'test-cache_attrs.R:38:3', 'test-colorize_nodes_edges.R:415:3',
        'test-create_combine_nodes.R:88:3', 'test-create_subgraph.R:73:3',
        'test-delete_node_edge.R:286:3',
        'test-get_select_last_nodes_edges_created.R:135:3',
        'test-graph_series.R:361:3', 'test-graph_validation.R:17:3',
        'test-graph_validation.R:241:3', 'test-graph_validation.R:301:3',
        'test-render_graph.R:3:3', 'test-selections.R:163:3',
        'test-set_get_node_edge_attrs.R:332:3', 'test-similarity_measures.R:106:3',
        'test-similarity_measures.R:126:3', 'test-transform_graph.R:138:3',
        'test-transform_graph.R:308:3', 'test-trav_out_until.R:73:3',
        'test-traversals.R:148:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-get_node_calculations.R:341:3'): Getting authority centrality is possible ──
      Error in `names(res$hub.vector) <- vertex_attr(graph, "name", V(graph))`: attempt to set an attribute on NULL
      Backtrace:
          ▆
       1. └─DiagrammeR::get_authority_centrality(graph = graph_1) at test-get_node_calculations.R:341:3
       2.   └─igraph::authority_score(graph = ig_graph, weights = weights_attr)
       3.     └─igraph::hits_scores(...)
       4.       └─igraph:::hub_and_authority_scores_impl(...)
      
      [ FAIL 1 | WARN 1 | SKIP 24 | PASS 1686 ]
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

# ECoL

<details>

* Version: 0.3.0
* GitHub: https://github.com/lpfgarcia/ECoL
* Source code: https://github.com/cran/ECoL
* Date/Publication: 2019-11-05 05:10:02 UTC
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "ECoL")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ECoL-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: complexity
    > ### Title: Extract the complexity measures from datasets
    > ### Aliases: complexity complexity.default complexity.formula
    > 
    > ### ** Examples
    > 
    > ## Extract all complexity measures for classification task
    > data(iris)
    > complexity(Species ~ ., iris)
    Warning: `hub.score()` was deprecated in igraph 2.0.0.
    ℹ Please use `hits_score()` instead.
    ℹ The deprecated feature was likely used in the ECoL package.
      Please report the issue at <https://github.com/lpfgarcia/ECoL/issues>.
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: complexity ... hub_score -> hits_scores -> hub_and_authority_scores_impl
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ECoL)
      > 
      > test_check("ECoL")
      [ FAIL 3 | WARN 3 | SKIP 0 | PASS 96 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_complexity.R:6:3'): multiclass.result ──────────────────────────
      Error in `names(res$hub.vector) <- vertex_attr(graph, "name", V(graph))`: attempt to set an attribute on NULL
      Backtrace:
           ▆
        1. ├─ECoL::complexity(Species ~ ., iris) at test_complexity.R:6:3
        2. └─ECoL:::complexity.formula(Species ~ ., iris)
        3.   └─ECoL:::complexity.default(...)
        4.     ├─base::unlist(...)
        5.     └─base::sapply(...)
        6.       └─base::lapply(X = X, FUN = FUN, ...)
        7.         └─ECoL (local) FUN(X[[i]], ...)
        8.           ├─base::do.call(group, list(x = x, y = y, summary = summary, ...))
        9.           ├─ECoL::network(x = `<df[,4]>`, y = `<fct>`, summary = `<chr>`)
       10.           └─ECoL:::network.default(x = `<df[,4]>`, y = `<fct>`, summary = `<chr>`)
       11.             └─base::sapply(...)
       12.               └─base::lapply(X = X, FUN = FUN, ...)
       13.                 └─ECoL (local) FUN(X[[i]], ...)
       14.                   ├─base::eval(call(paste("c", f, sep = "."), graph))
       15.                   │ └─base::eval(call(paste("c", f, sep = "."), graph))
       16.                   └─ECoL:::c.Hubs(`<igraph>`)
       17.                     └─igraph::hub.score(graph)
       18.                       └─igraph::hub_score(...)
       19.                         └─igraph::hits_scores(...)
       20.                           └─igraph:::hub_and_authority_scores_impl(...)
      ── Error ('test_complexity.R:18:3'): binary.result ─────────────────────────────
      Error in `names(res$hub.vector) <- vertex_attr(graph, "name", V(graph))`: attempt to set an attribute on NULL
      Backtrace:
           ▆
        1. ├─ECoL::complexity(Species ~ ., iris) at test_complexity.R:18:3
        2. └─ECoL:::complexity.formula(Species ~ ., iris)
        3.   └─ECoL:::complexity.default(...)
        4.     ├─base::unlist(...)
        5.     └─base::sapply(...)
        6.       └─base::lapply(X = X, FUN = FUN, ...)
        7.         └─ECoL (local) FUN(X[[i]], ...)
        8.           ├─base::do.call(group, list(x = x, y = y, summary = summary, ...))
        9.           ├─ECoL::network(x = `<df[,4]>`, y = `<fct>`, summary = `<chr>`)
       10.           └─ECoL:::network.default(x = `<df[,4]>`, y = `<fct>`, summary = `<chr>`)
       11.             └─base::sapply(...)
       12.               └─base::lapply(X = X, FUN = FUN, ...)
       13.                 └─ECoL (local) FUN(X[[i]], ...)
       14.                   ├─base::eval(call(paste("c", f, sep = "."), graph))
       15.                   │ └─base::eval(call(paste("c", f, sep = "."), graph))
       16.                   └─ECoL:::c.Hubs(`<igraph>`)
       17.                     └─igraph::hub.score(graph)
       18.                       └─igraph::hub_score(...)
       19.                         └─igraph::hits_scores(...)
       20.                           └─igraph:::hub_and_authority_scores_impl(...)
      ── Error ('test_network.R:11:3'): multiclass.result ────────────────────────────
      Error in `names(res$hub.vector) <- vertex_attr(graph, "name", V(graph))`: attempt to set an attribute on NULL
      Backtrace:
           ▆
        1. ├─ECoL::network(Species ~ ., iris, measures = "Hubs", summary = "mean") at test_network.R:11:3
        2. └─ECoL:::network.formula(...)
        3.   └─ECoL:::network.default(...)
        4.     └─base::sapply(...)
        5.       └─base::lapply(X = X, FUN = FUN, ...)
        6.         └─ECoL (local) FUN(X[[i]], ...)
        7.           ├─base::eval(call(paste("c", f, sep = "."), graph))
        8.           │ └─base::eval(call(paste("c", f, sep = "."), graph))
        9.           └─ECoL:::c.Hubs(`<igraph>`)
       10.             └─igraph::hub.score(graph)
       11.               └─igraph::hub_score(...)
       12.                 └─igraph::hits_scores(...)
       13.                   └─igraph:::hub_and_authority_scores_impl(...)
      
      [ FAIL 3 | WARN 3 | SKIP 0 | PASS 96 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# HospitalNetwork

<details>

* Version: 0.9.3
* GitHub: https://github.com/PascalCrepey/HospitalNetwork
* Source code: https://github.com/cran/HospitalNetwork
* Date/Publication: 2023-02-27 08:22:43 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "HospitalNetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘HospitalNetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: HospiNet
    > ### Title: Class providing the HospiNet object with its methods
    > ### Aliases: HospiNet
    > ### Keywords: data
    > 
    > ### ** Examples
    > 
    > mydbsmall <- create_fake_subjectDB(n_subjects = 100, n_facilities = 10)
    > 
    > hn <- hospinet_from_subject_database(
    +   base = checkBase(mydbsmall),
    +   window_threshold = 10,
    +   count_option = "successive",
    +   condition = "dates"
    + )
    Checking for missing values...
    Checking for duplicated records...
    Removed 0 duplicates
    Done.
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: hospinet_from_subject_database ... <Anonymous> -> hits_scores -> hub_and_authority_scores_impl
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(HospitalNetwork)
      Loading required package: data.table
      > 
      > test_check("HospitalNetwork")
      [ FAIL 2 | WARN 1 | SKIP 2 | PASS 55 ]
      
      ══ Skipped tests (2) ═══════════════════════════════════════════════════════════
      • On CRAN (2): 'test-HospiNet.R:19:3', 'test-HospiNet.R:37:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-HospiNet.R:7:3'): No loop option ───────────────────────────────
      Error in `names(res$hub.vector) <- vertex_attr(graph, "name", V(graph))`: attempt to set an attribute on NULL
      Backtrace:
           ▆
        1. ├─HospitalNetwork::hospinet_from_subject_database(checked_db) at test-HospiNet.R:7:3
        2. │ └─HospiNet$new(...)
        3. │   └─HospitalNetwork (local) initialize(...)
        4. ├─HospitalNetwork (local) `<fn>`()
        5. │ └─base::Reduce(...)
        6. └─HospitalNetwork (local) `<fn>`()
        7.   └─HospitalNetwork:::get_hubs_bycluster(...)
        8.     └─base::lapply(...)
        9.       └─HospitalNetwork (local) FUN(X[[i]], ...)
       10.         └─igraph::hub_score(x, ...)
       11.           └─igraph::hits_scores(...)
       12.             └─igraph:::hub_and_authority_scores_impl(...)
      ── Error ('test-networkAnalysis.R:10:3'): check clusters computation ───────────
      Error in `names(res$hub.vector) <- vertex_attr(graph, "name", V(graph))`: attempt to set an attribute on NULL
      Backtrace:
           ▆
        1. ├─HospitalNetwork::hospinet_from_subject_database(checked_db) at test-networkAnalysis.R:10:3
        2. │ └─HospiNet$new(...)
        3. │   └─HospitalNetwork (local) initialize(...)
        4. ├─HospitalNetwork (local) `<fn>`()
        5. │ └─base::Reduce(...)
        6. └─HospitalNetwork (local) `<fn>`()
        7.   └─HospitalNetwork:::get_hubs_bycluster(...)
        8.     └─base::lapply(...)
        9.       └─HospitalNetwork (local) FUN(X[[i]], ...)
       10.         └─igraph::hub_score(x, ...)
       11.           └─igraph::hits_scores(...)
       12.             └─igraph:::hub_and_authority_scores_impl(...)
      
      [ FAIL 2 | WARN 1 | SKIP 2 | PASS 55 ]
      Deleting unused snapshots:
      • HospiNet/clmat100.svg
      • HospiNet/clustdeg500.svg
      • HospiNet/clustmatclust500.svg
      • HospiNet/deg100.svg
      • HospiNet/mat100.svg
      • HospiNet/matclust500.svg
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘HospitalNetwork-Workflow.Rmd’ using rmarkdown
    
    Quitting from lines 154-157 [setup2] (HospitalNetwork-Workflow.Rmd)
    Error: processing vignette 'HospitalNetwork-Workflow.Rmd' failed with diagnostics:
    attempt to set an attribute on NULL
    --- failed re-building ‘HospitalNetwork-Workflow.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘HospitalNetwork-Workflow.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘HospitalNetwork-Workflow.Rmd’
      ...
    > library(HospitalNetwork)
    
    > base = create_fake_subjectDB(n_subjects = 100, n_facilities = 10, 
    +     with_errors = TRUE)
    
    > checkBase(base)
    
      When sourcing ‘HospitalNetwork-Workflow.R’:
    Error: Column(s) sID, fID, Adate, Ddate provided as argument were not found in the database.
    Execution halted
    
      ‘HospitalNetwork-Workflow.Rmd’ using ‘UTF-8’... failed
    ```

# immuneSIM

<details>

* Version: 0.8.7
* GitHub: https://github.com/GreiffLab/immuneSIM
* Source code: https://github.com/cran/immuneSIM
* Date/Publication: 2019-09-27 10:30:06 UTC
* Number of recursive dependencies: 66

Run `revdepcheck::cloud_details(, "immuneSIM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘immuneSIM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hub_seqs_exclusion
    > ### Title: Deletes top hub sequences from repertoire, changing the network
    > ###   architecture.
    > ### Aliases: hub_seqs_exclusion
    > 
    > ### ** Examples
    > 
    > repertoire <- list_example_repertoires[["example_repertoire_A"]]
    > rep_excluded_hubs <- hub_seqs_exclusion(repertoire, top_x = 0.005, output_dir = "")
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: hub_seqs_exclusion ... <Anonymous> -> hits_scores -> hub_and_authority_scores_impl
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.2Mb
      sub-directories of 1Mb or more:
        R   8.1Mb
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# ITNr

<details>

* Version: 0.7.0
* GitHub: NA
* Source code: https://github.com/cran/ITNr
* Date/Publication: 2023-03-31 14:10:11 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "ITNr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ITNr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ITNcentrality
    > ### Title: ITN Centrality
    > ### Aliases: ITNcentrality
    > 
    > ### ** Examples
    > 
    > require(igraph)
    Loading required package: igraph
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:network’:
    
        %c%, %s%, add.edges, add.vertices, delete.edges, delete.vertices,
        get.edge.attribute, get.edges, get.vertex.attribute, is.bipartite,
        is.directed, list.edge.attributes, list.vertex.attributes,
        set.edge.attribute, set.vertex.attribute
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    > ##Create random International Trade Network (igraph object)
    > ITN<-erdos.renyi.game(75,0.05,directed = TRUE)
    > 
    > ##Add edge weights
    > E(ITN)$weight<-runif(ecount(ITN), 0, 1)
    > 
    > ##Add vertex names
    > V(ITN)$name<-1:vcount(ITN)
    > 
    > ##Calculate the centrality measures
    > ITNCENT<-ITNcentrality(ITN)
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: ITNcentrality ... <Anonymous> -> hits_scores -> hub_and_authority_scores_impl
    Execution halted
    ```

# NAIR

<details>

* Version: 1.0.4
* GitHub: https://github.com/mlizhangx/Network-Analysis-for-Repertoire-Sequencing-
* Source code: https://github.com/cran/NAIR
* Date/Publication: 2024-03-03 00:52:36 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "NAIR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NAIR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: addNodeNetworkStats
    > ### Title: Compute Node-Level Network Properties
    > ### Aliases: addNodeNetworkStats
    > 
    > ### ** Examples
    > 
    > set.seed(42)
    > toy_data <- simulateToyData()
    > 
    > net <-
    +   generateNetworkObjects(
    +     toy_data,
    +     "CloneSeq"
    +   )
    > 
    > net$node_data <-
    +   addNodeNetworkStats(
    +     net$node_data,
    +     net$igraph
    +   )
    Warning: `addNodeNetworkStats()` was deprecated in NAIR 1.0.1.
    ℹ Please use `addNodeStats()` instead.
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: addNodeNetworkStats ... <Anonymous> -> hits_scores -> hub_and_authority_scores_impl
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NAIR)
      Welcome to NAIR: Network Analysis of Immune Repertoire.
      Get started using `vignette("NAIR")`, or by visiting
      https://mlizhangx.github.io/Network-Analysis-for-Repertoire-Sequencing-/
      > 
      > test_check("NAIR")
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 869 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_functions.R:21:1'): (code run outside of `test_that()`) ────────
      Error in `names(res$hub.vector) <- vertex_attr(graph, "name", V(graph))`: attempt to set an attribute on NULL
      Backtrace:
          ▆
       1. └─NAIR::addNodeStats(net) at test_functions.R:21:1
       2.   └─igraph::authority_score(net$igraph, weights = NA)
       3.     └─igraph::hits_scores(...)
       4.       └─igraph:::hub_and_authority_scores_impl(...)
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 869 ]
      Error: Test failures
      Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘buildRepSeqNetwork.Rmd’
      ...
    > nrow(toy_data)
    [1] 200
    
    > net <- buildNet(toy_data, "CloneSeq")
    
    > net <- buildNet(toy_data, "CloneSeq", node_stats = TRUE)
    
      When sourcing ‘buildRepSeqNetwork.R’:
    Error: attempt to set an attribute on NULL
    Execution halted
    when running code in ‘node_properties.Rmd’
      ...
    6 AGGTGGGAATTCG    0.010369470       4076  Sample1
    
    > nrow(toy_data)
    [1] 200
    
    > net <- buildNet(toy_data, "CloneSeq", node_stats = TRUE)
    
      When sourcing ‘node_properties.R’:
    Error: attempt to set an attribute on NULL
    Execution halted
    
      ‘NAIR.Rmd’ using ‘UTF-8’... OK
      ‘buildRepSeqNetwork.Rmd’ using ‘UTF-8’... failed
      ‘cluster_analysis.Rmd’ using ‘UTF-8’... OK
      ‘dual_chain.Rmd’ using ‘UTF-8’... OK
      ‘node_properties.Rmd’ using ‘UTF-8’... failed
      ‘supplementary.Rmd’ using ‘UTF-8’... OK
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘NAIR.Rmd’ using rmarkdown
    --- finished re-building ‘NAIR.Rmd’
    
    --- re-building ‘buildRepSeqNetwork.Rmd’ using rmarkdown
    
    Quitting from lines 150-151 [unnamed-chunk-9] (buildRepSeqNetwork.Rmd)
    Error: processing vignette 'buildRepSeqNetwork.Rmd' failed with diagnostics:
    attempt to set an attribute on NULL
    --- failed re-building ‘buildRepSeqNetwork.Rmd’
    
    --- re-building ‘cluster_analysis.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        libs   4.3Mb
    ```

# NetFACS

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/NetFACS
* Date/Publication: 2022-12-06 17:32:35 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "NetFACS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetFACS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network_summary
    > ### Title: Returns all kinds of network measures for the netfacs network
    > ### Aliases: network_summary network.summary
    > 
    > ### ** Examples
    > 
    > data(emotions_set)
    > angry.face <- netfacs(
    +   data = emotions_set[[1]],
    +   condition = emotions_set[[2]]$emotion,
    +   test.condition = "anger",
    +   ran.trials = 10,
    +   combination.size = 2
    + )
    > 
    > anger.net <- netfacs_network(
    +   netfacs.data = angry.face,
    +   link = "unweighted",
    +   significance = 0.01,
    +   min.count = 1
    + )
    > 
    > network_summary(anger.net)
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: network_summary ... <Anonymous> -> hits_scores -> hub_and_authority_scores_impl
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘netfacs_tutorial.Rmd’
      ...
    +     link = "unweighted")
    
    > network_plot(all.net, title = "all network with clusters", 
    +     clusters = TRUE, plot.bubbles = TRUE)
    
    > net.sum <- network_summary(angry.net)
    
      When sourcing ‘netfacs_tutorial.R’:
    Error: attempt to set an attribute on NULL
    Execution halted
    
      ‘netfacs_tutorial.Rmd’ using ‘UTF-8’... failed
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘netfacs_tutorial.Rmd’ using rmarkdown
    ```

# NIMAA

<details>

* Version: 0.2.1
* GitHub: https://github.com/jafarilab/NIMAA
* Source code: https://github.com/cran/NIMAA
* Date/Publication: 2022-04-11 14:12:45 UTC
* Number of recursive dependencies: 172

Run `revdepcheck::cloud_details(, "NIMAA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NIMAA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: analyseNetwork
    > ### Title: General properties of the network
    > ### Aliases: analyseNetwork
    > 
    > ### ** Examples
    > 
    > # generate a toy graph
    > g1 <- igraph::make_graph(c(1, 2, 3, 4, 1, 3), directed = FALSE)
    > igraph::V(g1)$name <- c("n1", "n2", "n3", "n4")
    > 
    > # generate random graph according to the Erdos-Renyi model
    > g2 <- igraph::sample_gnm(10, 23)
    > igraph::V(g2)$name <- letters[1:10]
    > 
    > # run analyseNetwork
    > analyseNetwork(g1)
    Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
      attempt to set an attribute on NULL
    Calls: analyseNetwork ... <Anonymous> -> hits_scores -> hub_and_authority_scores_impl
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NIMAA)
      > 
      > test_check("NIMAA")
      binmatnest.temperature 
                    13.21203 
      Size of Square: 	 66 rows x  66 columns 
      Size of Rectangular_row: 	 6 rows x  105 columns 
      Size of Rectangular_col: 	 99 rows x  2 columns 
      Size of Rectangular_element_max: 	 59 rows x  79 columns 
      
      
      |             | walktrap| louvain| infomap| label_prop| leading_eigen| fast_greedy|
      |:------------|--------:|-------:|-------:|----------:|-------------:|-----------:|
      |modularity   |    0.375|   0.375|   0.375|      0.375|         0.375|       0.375|
      |avg.silwidth |    1.000|   1.000|   1.000|      1.000|         1.000|       1.000|
      |coverage     |    1.000|   1.000|   1.000|      1.000|         1.000|       1.000|
      [ FAIL 1 | WARN 8 | SKIP 0 | PASS 10 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-analyse-network.R:6:3'): results has three elements ────────────
      Error in `names(res$hub.vector) <- vertex_attr(graph, "name", V(graph))`: attempt to set an attribute on NULL
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(length(analyseNetwork(g1)), 3) at test-analyse-network.R:6:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─NIMAA::analyseNetwork(g1)
       5.   └─igraph::hub_score(graph)
       6.     └─igraph::hits_scores(...)
       7.       └─igraph:::hub_and_authority_scores_impl(...)
      
      [ FAIL 1 | WARN 8 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘NIMAA-vignette.Rmd’
      ...
    > knitr::include_graphics("interactiveplot.png")
    [1] "interactiveplot.png"
    attr(,"class")
    [1] "knit_image_paths" "knit_asis"       
    
    > analysis_reuslt <- analyseNetwork(bipartGraph)
    
      When sourcing ‘NIMAA-vignette.R’:
    Error: attempt to set an attribute on NULL
    Execution halted
    
      ‘NIMAA-vignette.Rmd’ using ‘UTF-8’... failed
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘NIMAA-vignette.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        data   2.0Mb
        doc    4.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# pkggraph

<details>

* Version: 0.2.3
* GitHub: https://github.com/talegari/pkggraph
* Source code: https://github.com/cran/pkggraph
* Date/Publication: 2018-11-15 09:50:03 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "pkggraph")` for more info

</details>

## Newly broken

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘vignette_pkggraph.Rmd’
      ...
    
    > neighborhood_graph("tidytext", type = "igraph") %>% 
    +     extract2(1) %>% authority_score() %>% extract2("vector") %>% 
    +     tibble(package = name .... [TRUNCATED] 
    Warning: `authority_score()` was deprecated in igraph 2.0.4.
    ℹ Please use `hits_scores()` instead.
    
      When sourcing ‘vignette_pkggraph.R’:
    Error: attempt to set an attribute on NULL
    Execution halted
    
      ‘vignette_pkggraph.Rmd’ using ‘UTF-8’... failed
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘vignette_pkggraph.Rmd’ using rmarkdown
    
    Quitting from lines 34-58 [unnamed-chunk-2] (vignette_pkggraph.Rmd)
    Error: processing vignette 'vignette_pkggraph.Rmd' failed with diagnostics:
    attempt to set an attribute on NULL
    --- failed re-building ‘vignette_pkggraph.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘vignette_pkggraph.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# qgraph

<details>

* Version: 1.9.8
* GitHub: https://github.com/SachaEpskamp/qgraph
* Source code: https://github.com/cran/qgraph
* Date/Publication: 2023-11-03 11:00:02 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "qgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘qgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: smallworldness
    > ### Title: Compute the small-worldness index.
    > ### Aliases: smallworldness
    > ### Keywords: smallworld transitivity
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    > # a regular lattice. Even if the small-worldness is higher than three, the average path length is 
    > # much higher than that of random networks.
    > regnet<-igraph::watts.strogatz.game(dim=1, size=1000, nei=10, p=0, loops=FALSE, multiple=FALSE)
    Warning: `watts.strogatz.game()` was deprecated in igraph 2.0.0.
    ℹ Please use `sample_smallworld()` instead.
    > smallworldness(regnet, B=10)
    Error in `sample_degseq()`:
    ! `arg` must be one of "configuration", "vl", "fast.heur.simple",
      "configuration.simple", or "edge.switching.simple", not "simple.no.multiple".
    Backtrace:
         ▆
      1. ├─qgraph::smallworldness(regnet, B = 10)
      2. │ └─base::lapply(...)
      3. │   └─qgraph (local) FUN(X[[i]], ...)
      4. │     └─igraph::degree.sequence.game(deg.dist, method = "simple.no.multiple")
      5. │       └─igraph::sample_degseq(out.deg = out.deg, in.deg = in.deg, method = method)
      6. │         └─igraph:::igraph.match.arg(method)
      7. │           └─rlang::arg_match(arg = arg, values = values, error_call = error_call)
      8. │             └─rlang::arg_match0(arg, values, error_arg, error_call = error_call)
      9. └─rlang:::stop_arg_match(w, values = x, error_arg = y, error_call = z)
     10.   └─rlang::abort(msg, call = error_call, arg = error_arg)
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
      [ FAIL 13 | WARN 9 | SKIP 1 | PASS 426 ]
      
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
      
      [ FAIL 13 | WARN 9 | SKIP 1 | PASS 426 ]
      Error: Test failures
      Execution halted
    ```

