# alakazam

<details>

* Version: 1.3.0
* GitHub: NA
* Source code: https://github.com/cran/alakazam
* Date/Publication: 2023-09-30 01:12:40 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "alakazam")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘AminoAcids-Vignette.Rmd’ using rmarkdown
    --- finished re-building ‘AminoAcids-Vignette.Rmd’
    
    --- re-building ‘Diversity-Vignette.Rmd’ using rmarkdown
    --- finished re-building ‘Diversity-Vignette.Rmd’
    
    --- re-building ‘Fastq-Vignette.Rmd’ using rmarkdown
    --- finished re-building ‘Fastq-Vignette.Rmd’
    
    --- re-building ‘Files-Vignette.Rmd’ using rmarkdown
    --- finished re-building ‘Files-Vignette.Rmd’
    
    --- re-building ‘GeneUsage-Vignette.Rmd’ using rmarkdown
    --- finished re-building ‘GeneUsage-Vignette.Rmd’
    
    --- re-building ‘Lineage-Vignette.Rmd’ using rmarkdown
    
    Quitting from Lineage-Vignette.Rmd:149-165 [unnamed-chunk-7]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    <error/rlang_error>
    Error in `paste0()`:
    ! cannot coerce type 'closure' to vector of type 'character'
    ---
    Backtrace:
         x
      1. +-base::plot(...)
      2. +-base::plot(...)
      3. +-igraph::plot.igraph(...)
      4. | \-igraph (local) params("vertex", "label")
      5. |   \-cli::cli_warn("{type} attribute {name} contains NAs. Replacing with default value {i.default.values[[type]][[name]]\n        }")
      6. |     +-rlang::warn(format_warning(message, .envir = .envir), ...)
      7. |     | \-rlang:::validate_signal_args(...)
      8. |     \-cli::format_warning(message, .envir = .envir)
      9. |       \-cli::cli_fmt(...)
     10. |         \-cli:::cli__fmt(rec, collapse, strip_newline)
     11. |           +-base::do.call(app[[msg$type]], msg$args)
     12. |           \-cli (local) `<fn>`(text = `<named list>`, id = "cli-151-3", class = NULL)
     13. |             \-cli:::clii_bullets(app, text, id, class)
     14. |               \-base::lapply(...)
     15. |                 \-cli (local) FUN(X[[i]], ...)
     16. |                   \-app$text(text[[i]])
     17. |                     \-cli:::clii_text(app, text)
     18. |                       \-app$xtext(text)
     19. |                         \-cli:::clii__xtext(...)
     20. |                           \-app$inline(text, .list = .list)
     21. |                             \-cli:::clii__inline(app, text, .list = .list)
     22. |                               \-base::lapply(...)
     23. |                                 \-cli (local) FUN(X[[i]], ...)
     24. |                                   \-cli:::glue(...)
     25. \-cli (local) `<fn>`("v7")
     26.   +-.transformer(expr, .envir) %||% character()
     27.   \-cli (local) .transformer(expr, .envir)
     28.     +-cli:::inline_collapse(...)
     29.     | \-cli::ansi_collapse(...)
     30.     |   \-cli:::collapse_both_ends(x, sep, sep2, last, trunc, width, ellipsis)
     31.     \-cli:::inline_generic(app, val, style = style)
     32.       \-base::paste0(before, x, after)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'Lineage-Vignette.Rmd' failed with diagnostics:
    cannot coerce type 'closure' to vector of type 'character'
    --- failed re-building ‘Lineage-Vignette.Rmd’
    
    --- re-building ‘Topology-Vignette.Rmd’ using rmarkdown
    --- finished re-building ‘Topology-Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Lineage-Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) buildPhylipLineage.Rd:61: Lost braces; missing escapes or markup?
        61 |                                      names with the format {"Inferred1", "Inferred2", ...}.
           |                                                            ^
    ```

# arulesViz

<details>

* Version: 1.5.3
* GitHub: https://github.com/mhahsler/arulesViz
* Source code: https://github.com/cran/arulesViz
* Date/Publication: 2024-04-26 09:20:02 UTC
* Number of recursive dependencies: 124

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
    set transactions ...[169 item(s), 9835 transaction(s)] done [0.00s].
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
    IGRAPH 2f55f5f DN-B 27 45 -- 
    + attr: name (v/c), label (v/c), index (v/n), type (v/n), support
    | (v/n), confidence (v/n), coverage (v/n), lift (v/n), count (v/n)
    + edges from 2f55f5f (vertex names):
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
    Error in paste0(before, x, after) : 
      cannot coerce type 'closure' to vector of type 'character'
    Calls: plot ... ansi_collapse -> collapse_both_ends -> inline_generic -> paste0
    Execution halted
    ```

# ccTensor

<details>

* Version: 1.0.2
* GitHub: https://github.com/rikenbit/ccTensor
* Source code: https://github.com/cran/ccTensor
* Date/Publication: 2021-08-12 04:30:07 UTC
* Number of recursive dependencies: 57

Run `revdepcheck::cloud_details(, "ccTensor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ccTensor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CUR
    > ### Title: CUR Matrix Decomposition
    > ### Aliases: CUR
    > ### Keywords: methods
    > 
    > ### ** Examples
    > 
    >     library("ccTensor")
    >     library("nnTensor")
    >     # Test data
    >     matdata <- toyModel(model = "NMF")
    >     # Simple usage
    >     out <- CUR(matdata, c.rank=3, r.rank=4)
    Error in as(incidence, "dgCMatrix") : 
      no method or default for coercing “matrix” to “dgCMatrix”
    Calls: CUR ... graph_from_biadjacency_matrix -> graph_incidence_build -> as
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘fields’
      All declared Imports should be used.
    ```

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) CUR.Rd:25: Lost braces; missing escapes or markup?
        25 | The number of low-dimension of C (J1 < {N,M}).
           |                                        ^
    checkRd: (-1) CUR.Rd:29: Lost braces; missing escapes or markup?
        29 | The number of low-dimension of R (J2 < {N,M}).
           |                                        ^
    checkRd: (-1) CX.Rd:23: Lost braces; missing escapes or markup?
        23 | The number of low-dimension (J < {N,M}).
           |                                  ^
    ```

# corpustools

<details>

* Version: 0.5.1
* GitHub: https://github.com/kasperwelbers/corpustools
* Source code: https://github.com/cran/corpustools
* Date/Publication: 2023-05-08 09:50:15 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::cloud_details(, "corpustools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘corpustools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ego_semnet
    > ### Title: Create an ego network
    > ### Aliases: ego_semnet
    > 
    > ### ** Examples
    > 
    > tc = create_tcorpus(c('a b c', 'd e f', 'a d'))
    > g = semnet(tc, 'token')
    > 
    > igraph::get.data.frame(g)
       from to weight
    1     b  a    1.0
    2     c  a    1.0
    3     d  a    0.5
    4     a  b    0.5
    5     c  b    1.0
    6     a  c    0.5
    7     b  c    1.0
    8     a  d    0.5
    9     e  d    1.0
    10    f  d    1.0
    11    d  e    0.5
    12    f  e    1.0
    13    d  f    0.5
    14    e  f    1.0
    > ## only keep nodes directly connected to given node
    > g_ego = ego_semnet(g, 'e')
    > igraph::get.data.frame(g_ego)
      from to weight
    1    e  d    1.0
    2    f  d    1.0
    3    d  e    0.5
    4    f  e    1.0
    5    d  f    0.5
    6    e  f    1.0
    > 
    > ## only keep edges directly connected to given node
    > g_ego = ego_semnet(g, 'e', only_filter_vertices = FALSE)
    Error:
    ! The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
    Backtrace:
        ▆
     1. └─corpustools::ego_semnet(g, "e", only_filter_vertices = FALSE)
     2.   └─igraph::get.edge.ids(g, vp = rbind(ego$x, ego$y))
     3.     └─igraph::get_edge_ids(...)
     4.       └─igraph:::el_to_vec(vp, call = rlang::caller_env())
     5.         └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
     6.           └─lifecycle:::deprecate_stop0(msg)
     7.             └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        libs   5.5Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 438 marked UTF-8 strings
    ```

# discourseGT

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/discourseGT
* Date/Publication: 2023-07-19 07:20:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "discourseGT")` for more info

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
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
      > 
      > library(testthat)
      > library(discourseGT)
      > 
      > test_check("discourseGT")
      [ FAIL 5 | WARN 14 | SKIP 0 | PASS 30 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-basicPlot.R:12:3'): basicPlot works ──────────────────────────
      `basicPlot(ginp, graph_selection_input = 0)` produced warnings.
      ── Failure ('test-basicPlot.R:15:3'): basicPlot works ──────────────────────────
      `basicPlot(ginp, graph_selection_input = 1)` produced warnings.
      ── Failure ('test-basicPlot.R:18:3'): basicPlot works ──────────────────────────
      `basicPlot(ginp, graph_selection_input = 2)` produced warnings.
      ── Failure ('test-basicPlot.R:21:3'): basicPlot works ──────────────────────────
      `basicPlot(...)` produced warnings.
      ── Failure ('test-basicPlot.R:27:3'): basicPlot works ──────────────────────────
      `basicPlot(ginp, graph_selection_input = 0, scaledEdgeLines = FALSE)` produced warnings.
      
      [ FAIL 5 | WARN 14 | SKIP 0 | PASS 30 ]
      Error: Test failures
      Execution halted
    ```

# dosearch

<details>

* Version: 1.0.11
* GitHub: https://github.com/santikka/dosearch
* Source code: https://github.com/cran/dosearch
* Date/Publication: 2024-07-16 09:50:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "dosearch")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > #' @srrstats {G5.2} Error and warning behavior is tested.
      > #' @srrstats {G5.2a} Messages are unique.
      > #' @srrstats {G5.2b} Conditions are demonstrated.
      > #' @srrstats {G5.4, G5.4a, G5.6} Output of dosearch is compared against known
      > #'   theoretical identifiability and non-identifiability results.
      > #'   In other words, correctness can be tested independently of the
      > #'   implementation.
      > #' @srrstats {G5.5} The algorithm is deterministic, so this could also be NA
      > #' @srrstats {G5.6a} Because the package output is symbolic, the recovery
      > #'   of e.g., a causal effect is exact.
      > #' @srrstats {G5.7} Performance and scalability have been demonstrated
      > #'   in the JSS paper, and the simulations are too large to run on a single
      > #'   PC and require a cluster. The replication materials for this simulation
      > #'   are included in the 'rep' directory. The algorithm has exponential
      > #'   time and memory complexity in the number of the vertices of the graph,
      > #'   and it has been hypothesized that the general identifiability problem
      > #'   itself is NP-hard.
      > #' @srrstats {G5.8, G5.8a G5.8b, G5.8c, G5.8d} Edge conditions are tested.
      > #' @srrstats {NW6.0} Inputs types are tested.
      > #' @noRd
      > library(testthat)
      > library(dosearch)
      > 
      > test_check("dosearch")
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 294 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-interface.R:32:3'): igraph graph without names gets named ──────
      Error in `FUN(X[[i]], ...)`: Error: Logical index length does not match the number of edges. Recycling is not allowed.
      Backtrace:
           ▆
        1. ├─testthat::expect_message(parse_graph(g_igraph), "Argument `graph` is not named, node names have been assigned") at test-interface.R:32:3
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─dosearch:::parse_graph(g_igraph)
        8.   ├─e[(is.na(description) | description != "U")]
        9.   └─igraph:::`[.igraph.es`(...)
       10.     └─base::lapply(...)
       11.       └─igraph (local) FUN(X[[i]], ...)
       12.         └─cli::cli_abort("Error: Logical index length does not match the number of edges. Recycling is not allowed.")
       13.           └─rlang::abort(...)
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 294 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        libs   5.0Mb
    ```

# GMPro

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/GMPro
* Date/Publication: 2020-06-25 14:00:02 UTC
* Number of recursive dependencies: 35

Run `revdepcheck::cloud_details(, "GMPro")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GMPro-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: DP_SBM
    > ### Title: Degree profile graph matching with community detection.
    > ### Aliases: DP_SBM
    > 
    > ### ** Examples
    > 
    > ### Here we use graphs under stochastic block model(SBM).
    > set.seed(2020)
    > K = 2; n = 30; s = 1;
    > P  = matrix(c(1/2, 1/4, 1/4, 1/2), byrow = TRUE, nrow = K)
    > ### define community label matrix Pi
    > distribution = c(1, 2);
    > l = sample(distribution, n, replace=TRUE, prob = c(1/2, 1/2))
    > Pi = matrix(0, n, 2) # label matrix
    > for (i in 1:n){
    +   Pi[i, l[i]] = 1
    +   }
    > ### define the expectation of the parent graph's adjacency matrix
    > Omega = Pi %*% P %*% t(Pi)
    > ### construct the parent graph G
    > G = matrix(runif(n*n, 0, 1), nrow = n)
    > G = G - Omega
    > temp = G
    > G[which(temp >0)] = 0
    > G[which(temp <=0)] = 1
    > diag(G) = 0
    > G[lower.tri(G)] = t(G)[lower.tri(G)];
    > ### Sample Graphs Generation
    > ### generate graph A from G
    > dA = matrix(rbinom(n*n, 1, s), nrow = n, ncol=n)
    > dA[lower.tri(dA)] = t(dA)[lower.tri(dA)]
    > A1 = G*dA
    > indA = sample(1:n, n, replace = FALSE)
    > labelA = l[indA]
    > A = A1[indA, indA]
    > ### similarly, generate graph B from G
    > dB = matrix(rbinom(n*n, 1, s), nrow = n, ncol=n)
    > dB[lower.tri(dB)] = t(dB)[lower.tri(dB)]
    > B1 = G*dB
    > indB = sample(1:n, n, replace = FALSE)
    > labelB = l[indB]
    > B = B1[indB, indB]
    > DP_SBM(A = A, B = B, K = 2, fun = "EEpost", rep = 10, d = 3)
    Error in as(incidence, "dgCMatrix") : 
      no method or default for coercing “matrix” to “dgCMatrix”
    Calls: DP_SBM ... graph_from_biadjacency_matrix -> graph_incidence_build -> as
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(GMPro)
      > 
      > test_check("GMPro")
      [ FAIL 6 | WARN 1 | SKIP 0 | PASS 19 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-EE_SBM.R:59:3'): This function returns a distance matrix and a matching indicator matrix ──
      Error in `as(incidence, "dgCMatrix")`: no method or default for coercing "matrix" to "dgCMatrix"
      Backtrace:
          ▆
       1. ├─testthat::expect_length(...) at test-EE_SBM.R:59:3
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─GMPro::EE_SBM(A = A, B = B, K = 2, fun = "EEpost", d = 3, rep = 10)
       5.   └─GMPro::EEpost(A = A_com, B = B_com, rep = rep, tau = tau, d = d)
       6.     └─igraph::graph.incidence(Pi, weighted = TRUE)
       7.       └─igraph::graph_from_biadjacency_matrix(...)
       8.         └─igraph:::graph_incidence_build(...)
       9.           └─methods::as(incidence, "dgCMatrix")
      ── Error ('test-EEpost.R:44:3'): This function returns a distance matrix and a matching indicator matrix ──
      Error in `as(incidence, "dgCMatrix")`: no method or default for coercing "matrix" to "dgCMatrix"
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-EEpost.R:44:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─GMPro::EEpost(A = A, B = B, d = 5, rep = 10)
       5.   └─igraph::graph.incidence(Pi, weighted = TRUE)
       6.     └─igraph::graph_from_biadjacency_matrix(...)
       7.       └─igraph:::graph_incidence_build(...)
       8.         └─methods::as(incidence, "dgCMatrix")
      ── Error ('test-EEpost.R:50:3'): This function returns a distance matrix and a matching indicator matrix ──
      Error in `as(incidence, "dgCMatrix")`: no method or default for coercing "matrix" to "dgCMatrix"
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-EEpost.R:50:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─GMPro::EEpost(A = A, B = B, d = 5, rep = 10, matching = matching1)
       5.   └─igraph::graph.incidence(Pi, weighted = TRUE)
       6.     └─igraph::graph_from_biadjacency_matrix(...)
       7.       └─igraph:::graph_incidence_build(...)
       8.         └─methods::as(incidence, "dgCMatrix")
      ── Error ('test-EEpre.R:49:3'): This function returns a distance matrix and a matching indicator matrix ──
      Error in `as(incidence, "dgCMatrix")`: no method or default for coercing "matrix" to "dgCMatrix"
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(dim(EEpre(A, B, 5)$Dist), c(n.A, n.B)) at test-EEpre.R:49:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─GMPro::EEpre(A, B, 5)
       5.   └─GMPro:::seeded.match(A, B, seed)
       6.     └─igraph::graph.incidence(H, weighted = TRUE)
       7.       └─igraph::graph_from_biadjacency_matrix(...)
       8.         └─igraph:::graph_incidence_build(...)
       9.           └─methods::as(incidence, "dgCMatrix")
      ── Error ('test-EEpre.R:54:3'): This function returns a distance matrix and a matching indicator matrix (input seeds) ──
      Error in `as(incidence, "dgCMatrix")`: no method or default for coercing "matrix" to "dgCMatrix"
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-EEpre.R:54:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─GMPro::EEpre(A, B, 5, seed = seed)
       5.   └─GMPro:::seeded.match(A, B, seed)
       6.     └─igraph::graph.incidence(H, weighted = TRUE)
       7.       └─igraph::graph_from_biadjacency_matrix(...)
       8.         └─igraph:::graph_incidence_build(...)
       9.           └─methods::as(incidence, "dgCMatrix")
      ── Error ('test-EEpre.R:59:3'): This function returns a distance matrix and a matching indicator matrix (input AB_dist) ──
      Error in `as(incidence, "dgCMatrix")`: no method or default for coercing "matrix" to "dgCMatrix"
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-EEpre.R:59:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─GMPro::EEpre(A, B, 5, AB_dist = W)
       5.   └─GMPro:::seeded.match(A, B, seed)
       6.     └─igraph::graph.incidence(H, weighted = TRUE)
       7.       └─igraph::graph_from_biadjacency_matrix(...)
       8.         └─igraph:::graph_incidence_build(...)
       9.           └─methods::as(incidence, "dgCMatrix")
      
      [ FAIL 6 | WARN 1 | SKIP 0 | PASS 19 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# gsbm

<details>

* Version: 0.2.2
* GitHub: NA
* Source code: https://github.com/cran/gsbm
* Date/Publication: 2022-09-20 08:16:14 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "gsbm")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘PrimarySchool.Rmd’ using rmarkdown
    ```

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) crossval.Rd:54: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) crossval.Rd:55: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) crossval.Rd:56: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) crossval.Rd:57: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) crossval.Rd:58: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) crossval.Rd:59: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd.Rd:57: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd.Rd:58: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd.Rd:59: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd.Rd:60: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd.Rd:61: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd.Rd:62: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd_parallel.Rd:57: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd_parallel.Rd:58: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd_parallel.Rd:59: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd_parallel.Rd:60: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd_parallel.Rd:61: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) gsbm_mcgd_parallel.Rd:62: Lost braces in \itemize; \value handles \item{}{} directly
    ```

# incidentally

<details>

* Version: 1.0.2
* GitHub: https://github.com/zpneal/incidentally
* Source code: https://github.com/cran/incidentally
* Date/Publication: 2023-02-15 21:00:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "incidentally")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘congress.Rmd’ using rmarkdown
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1883678 bytes (1.8 MB)
    ==================================================
    downloaded 1.8 MB
    
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1883678 bytes (1.8 MB)
    ==================================================
    downloaded 1.8 MB
    ```

# klassR

<details>

* Version: 1.0.2
* GitHub: https://github.com/statisticsnorway/ssb-klassr
* Source code: https://github.com/cran/klassR
* Date/Publication: 2025-02-07 10:40:02 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "klassR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘klassR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: update_klass_node
    > ### Title: Given a node and a graph, find the node at the end of a sequence
    > ###   of changes.
    > ### Aliases: update_klass_node
    > 
    > ### ** Examples
    > 
    > 
    > # Build a graph directed towards the most recent codes.
    > library(klassR)
    > klass_131 <- klass_graph(131)
    Error in `FUN()`:
    ! Error: Logical index length does not match the number of edges.
      Recycling is not allowed.
    Backtrace:
        ▆
     1. └─klassR::klass_graph(131)
     2.   ├─igraph::reverse_edges(...)
     3.   │ └─igraph:::as_igraph_es(graph, eids)
     4.   ├─igraph::E(graph)[igraph::E(graph)$changeOccurred > date]
     5.   └─igraph:::`[.igraph.es`(...)
     6.     └─base::lapply(...)
     7.       └─igraph (local) FUN(X[[i]], ...)
     8.         └─cli::cli_abort("Error: Logical index length does not match the number of edges. Recycling is not allowed.")
     9.           └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1764 marked UTF-8 strings
    ```

# manynet

<details>

* Version: 1.3.2
* GitHub: https://github.com/stocnet/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2024-11-05 20:50:02 UTC
* Number of recursive dependencies: 144

Run `revdepcheck::cloud_details(, "manynet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(manynet)
      > 
      > test_check("manynet")
      Starting 2 test processes
      [ FAIL 1 | WARN 0 | SKIP 21 | PASS 561 ]
      
      ══ Skipped tests (21) ══════════════════════════════════════════════════════════
      • On CRAN (21): 'test-manip_as.R:86:3', 'test-manip_split.R:49:3',
        'test-map_autograph.R:2:3', 'test-map_autograph.R:17:3',
        'test-map_autograph.R:31:3', 'test-map_autograph.R:47:3',
        'test-map_autograph.R:65:3', 'test-map_autograph.R:91:3',
        'test-map_autograph.R:103:3', 'test-map_autograph.R:113:3',
        'test-map_autograph.R:120:3', 'test-map_autograph.R:127:3',
        'test-map_autograph.R:140:3', 'test-map_autograph.R:158:3',
        'test-map_autograph.R:171:3', 'test-map_autograph.R:180:3',
        'test-mark_nodes.R:36:3', 'test-mark_nodes.R:45:3', 'test-mark_nodes.R:82:3',
        'test-mark_ties.R:24:3', 'test-mark_ties.R:33:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-manip_format.R:9:3'): to_unweight works ────────────────────────
      Error in `as(incidence, "dgCMatrix")`: no method or default for coercing "matrix" to "dgCMatrix"
      Backtrace:
           ▆
        1. ├─testthat::expect_false(is_weighted(to_unweighted(as_network(st)))) at test-manip_format.R:9:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─manynet::is_weighted(to_unweighted(as_network(st)))
        5. ├─manynet::to_unweighted(as_network(st))
        6. └─manynet:::to_unweighted.network(as_network(st))
        7.   ├─manynet::as_network(to_unweighted(as_tidygraph(.data), threshold))
        8.   ├─manynet::to_unweighted(as_tidygraph(.data), threshold)
        9.   ├─manynet::as_tidygraph(.data)
       10.   └─manynet:::as_tidygraph.network(.data)
       11.     ├─tidygraph::as_tbl_graph(as_igraph(.data))
       12.     ├─manynet::as_igraph(.data)
       13.     └─manynet:::as_igraph.network(.data)
       14.       └─igraph::graph_from_biadjacency_matrix(graph, weighted = TRUE)
       15.         └─igraph:::graph_incidence_build(...)
       16.           └─methods::as(incidence, "dgCMatrix")
      
      [ FAIL 1 | WARN 0 | SKIP 21 | PASS 561 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘Rgraphviz’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        R           1.5Mb
        tutorials   1.9Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 7 marked UTF-8 strings
    ```

# MetaNet

<details>

* Version: 0.1.2
* GitHub: https://github.com/Asa12138/MetaNet
* Source code: https://github.com/cran/MetaNet
* Date/Publication: 2024-03-25 20:40:07 UTC
* Number of recursive dependencies: 154

Run `revdepcheck::cloud_details(, "MetaNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MetaNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: c_net_build
    > ### Title: Construct a metanet from a corr object
    > ### Aliases: c_net_build
    > 
    > ### ** Examples
    > 
    > data("otutab", package = "pcutils")
    > t(otutab) -> totu
    > metadata[, 3:10] -> env
    > c_net_calculate(totu) -> corr
    > c_net_build(corr, r_threshold = 0.65) -> co_net
    Have not do p-value adjustment! use the p.value to build network.
    No 'from' and 'to' columns in annotation table, will use 'name_from' and 'name_to' instead.
    > 
    > c_net_calculate(totu, env) -> corr2
    All samples matched.
    All objects are OK.
    > c_net_build(corr2) -> co_net2
    Have not do p-value adjustment! use the p.value to build network.
    Error in as(incidence, "dgCMatrix") : 
      no method or default for coercing “matrix” to “dgCMatrix”
    Calls: c_net_build ... graph_from_biadjacency_matrix -> graph_incidence_build -> as
    Execution halted
    ```

# multivariance

<details>

* Version: 2.4.1
* GitHub: NA
* Source code: https://github.com/cran/multivariance
* Date/Publication: 2021-10-06 15:50:05 UTC
* Number of recursive dependencies: 32

Run `revdepcheck::cloud_details(, "multivariance")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multivariance-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clean.graph
    > ### Title: cleanup dependence structure graph
    > ### Aliases: clean.graph
    > 
    > ### ** Examples
    > 
    > N = 200
    > y = coins(N,2)
    > x = cbind(y,y,y)
    > 
    > ds = dependence.structure(x,structure.type = "clustered")
    
        Dependence structure detection
    
    data: 'x' with 200 samples of 9 variables
    structure: clustered
    detection method: test -- method for p-values: conservative -- significance level: 0.05
    
    2-tuples x 36: max. multivariance: 200.000; min. p-value (unadjusted): 0
    New cluster detected. Not all vertices are in one cluster.
    2-tuples x 3: max. multivariance:   0.504; min. p-value (unadjusted): 0.477634223802113
    3-tuples x 1: max. multivariance: 199.392; min. p-value (unadjusted): 0
    All vertices are in one cluster.
    
    total number of tests: 40, groups of tests: 3
    
    Same structure for any significance level in (0,1)
    
    Conservative estimate of the type I error probability: 0.143
    > plot(clean.graph(ds$graph))
    Error in paste0(before, x, after) : 
      cannot coerce type 'closure' to vector of type 'character'
    Calls: plot ... ansi_collapse -> collapse_both_ends -> inline_generic -> paste0
    Execution halted
    ```

# mwcsr

<details>

* Version: 0.1.9
* GitHub: https://github.com/ctlab/mwcsr
* Source code: https://github.com/cran/mwcsr
* Date/Publication: 2024-09-09 11:30:10 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "mwcsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mwcsr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: virgo_solver
    > ### Title: Construct a virgo solver
    > ### Aliases: virgo_solver
    > 
    > ### ** Examples
    > 
    > data("sgmwcs_small_instance")
    > approx_vs <- virgo_solver(mst=TRUE, threads = 1)
    > approx_vs$run_main("-h")
    Option (* = required)                  Description                            
    ---------------------                  -----------                            
    --benchmark, --bm                      Benchmark output file (default: )      
    -c <Integer>                           Threshold for CPE solver (default: 25) 
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(mwcsr)
      > 
      > test_check("mwcsr")
      [ FAIL 2 | WARN 10 | SKIP 5 | PASS 41 ]
      
      ══ Skipped tests (5) ═══════════════════════════════════════════════════════════
      • No CPLEX available (3): 'test_virgo.R:5:9', 'test_virgo.R:15:9',
        'test_virgo.R:24:9'
      • SCIP is not available (2): 'test_scip.R:5:9', 'test_scip.R:16:9'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_virgo.R:48:5'): heuristic virgo_solver works on SGMWCS ─────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─mwcsr::solve_mwcsp(solver, sgmwcs_small_instance) at test_virgo.R:48:5
        2. └─mwcsr:::solve_mwcsp.virgo_solver(solver, sgmwcs_small_instance)
        3.   └─mwcsr:::solve_sgmwcs(solver, instance, ...)
        4.     └─mwcsr:::run_solver(...)
        5.       └─igraph::get.edge.ids(instance, t(edges[, 1:2]))
        6.         └─igraph::get_edge_ids(...)
        7.           └─igraph:::el_to_vec(vp, call = rlang::caller_env())
        8.             └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
        9.               └─lifecycle:::deprecate_stop0(msg)
       10.                 └─rlang::cnd_signal(...)
      ── Error ('test_virgo.R:81:5'): heuristic virgo_solver works on SGMWCS ─────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─mwcsr::solve_mwcsp(solver, si) at test_virgo.R:81:5
        2. └─mwcsr:::solve_mwcsp.virgo_solver(solver, si)
        3.   └─mwcsr:::solve_sgmwcs(solver, instance, ...)
        4.     └─mwcsr:::run_solver(...)
        5.       └─igraph::get.edge.ids(instance, t(edges[, 1:2]))
        6.         └─igraph::get_edge_ids(...)
        7.           └─igraph:::el_to_vec(vp, call = rlang::caller_env())
        8.             └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
        9.               └─lifecycle:::deprecate_stop0(msg)
       10.                 └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 10 | SKIP 5 | PASS 41 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        java   2.5Mb
        libs  10.5Mb
    ```

# nett

<details>

* Version: 1.0.0
* GitHub: https://github.com/aaamini/nett
* Source code: https://github.com/cran/nett
* Date/Publication: 2022-11-09 10:50:05 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "nett")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Community_Detection.Rmd’ using rmarkdown
    ```

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) spec_clust.Rd:33: Lost braces; missing escapes or markup?
        33 | A label vector of size n x 1 with elements in {1,2,...,K}
           |                                               ^
    ```

# POSetR

<details>

* Version: 1.1.4
* GitHub: NA
* Source code: https://github.com/cran/POSetR
* Date/Publication: 2023-12-04 15:20:15 UTC
* Number of recursive dependencies: 14

Run `revdepcheck::cloud_details(, "POSetR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘POSetR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: intersection
    > ### Title: Intersection of two posets
    > ### Aliases: intersection %it%
    > 
    > ### ** Examples
    > 
    > dom <- matrix(c(
    +   "a", "b",
    +   "c", "b",
    +   "b", "d"
    + ), ncol = 2, byrow = TRUE)
    > p <- poset(x = dom)
    > plot(p)
    Error in vapply(.x, .f, .mold, ..., USE.NAMES = FALSE) : 
      values must be length 1,
     but FUN(X[[1]]) result is length 0
    Calls: plot ... i.get.arrow.mode -> map_dbl -> .rlang_purrr_map_mold -> vapply
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 19.3Mb
      sub-directories of 1Mb or more:
        libs  19.2Mb
    ```

# remify

<details>

* Version: 3.2.8
* GitHub: https://github.com/TilburgNetworkGroup/remify
* Source code: https://github.com/cran/remify
* Date/Publication: 2025-01-29 13:20:05 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "remify")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      +   tinytest::test_package("remify")
      + }
      
      test-rehshape.R...............    0 tests    
      test-rehshape.R...............    1 tests [0;32mOK[0m 
      test-rehshape.R...............    1 tests [0;32mOK[0m 
      test-rehshape.R...............    2 tests [0;32mOK[0m 
      test-rehshape.R...............    3 tests [0;32mOK[0m 
      test-rehshape.R...............    4 tests [0;32mOK[0m 
      test-rehshape.R...............    5 tests [0;32mOK[0m 
      test-rehshape.R...............    6 tests [0;32mOK[0m 
      test-rehshape.R...............    7 tests [0;32mOK[0m 
      test-rehshape.R...............    8 tests [0;32mOK[0m 
      test-rehshape.R...............    9 tests [0;32mOK[0m 
      test-rehshape.R...............   10 tests [0;32mOK[0m 
      test-rehshape.R...............   10 tests [0;32mOK[0m 
      test-rehshape.R...............   11 tests [0;32mOK[0m 
      test-rehshape.R...............   12 tests [0;32mOK[0m 
      test-rehshape.R...............   13 tests [0;32mOK[0m 
      test-rehshape.R...............   14 tests [0;32mOK[0m 
      test-rehshape.R...............   15 tests [0;32mOK[0m 
      test-rehshape.R...............   16 tests [0;32mOK[0m 
      test-rehshape.R...............   17 tests [0;32mOK[0m 
      test-rehshape.R...............   18 tests [0;32mOK[0m 
      test-rehshape.R...............   19 tests [0;32mOK[0m 
      test-rehshape.R...............   19 tests [0;32mOK[0m 
      test-rehshape.R...............   20 tests [0;32mOK[0m 
      test-rehshape.R...............   20 tests [0;32mOK[0m 
      test-rehshape.R...............   21 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   23 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   25 tests [0;32mOK[0m 
      test-rehshape.R...............   26 tests [0;32mOK[0m [0;34m2.9s[0m
      
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    4 tests [0;32mOK[0m 
      test-remify-error-messages.R..    5 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    7 tests [0;32mOK[0m 
      test-remify-error-messages.R..    7 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   13 tests [0;32mOK[0m 
      test-remify-error-messages.R..   13 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   18 tests [0;32mOK[0m 
      test-remify-error-messages.R..   18 tests [0;32mOK[0m 
      test-remify-error-messages.R..   19 tests [0;32mOK[0m 
      test-remify-error-messages.R..   19 tests [0;32mOK[0m 
      test-remify-error-messages.R..   20 tests [0;32mOK[0m 
      test-remify-error-messages.R..   20 tests [0;32mOK[0m 
      test-remify-error-messages.R..   21 tests [0;32mOK[0m [0;34m0.2s[0m
      
      test-remify-methods.R.........    0 tests    
      test-remify-methods.R.........    0 tests    
      test-remify-methods.R.........    1 tests [0;32mOK[0m 
      test-remify-methods.R.........    2 tests [0;32mOK[0m 
      test-remify-methods.R.........    3 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    5 tests [0;32mOK[0m 
      test-remify-methods.R.........    6 tests [0;32mOK[0m 
      test-remify-methods.R.........    7 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    9 tests [0;32mOK[0m 
      test-remify-methods.R.........   10 tests [0;32mOK[0m 
      test-remify-methods.R.........   11 tests [0;32mOK[0m 
      test-remify-methods.R.........   12 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   14 tests [0;32mOK[0m 
      test-remify-methods.R.........   15 tests [0;32mOK[0m 
      test-remify-methods.R.........   16 tests [0;32mOK[0m 
      test-remify-methods.R.........   17 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   19 tests [0;32mOK[0m 
      test-remify-methods.R.........   20 tests [0;32mOK[0m 
      test-remify-methods.R.........   21 tests [0;32mOK[0m 
      test-remify-methods.R.........   22 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   24 tests [0;32mOK[0m 
      test-remify-methods.R.........   25 tests [0;32mOK[0m 
      test-remify-methods.R.........   26 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   28 tests [0;32mOK[0m 
      test-remify-methods.R.........   29 tests [0;32mOK[0m 
      test-remify-methods.R.........   30 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   32 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   34 tests [0;32mOK[0m 
      test-remify-methods.R.........   35 tests [0;32mOK[0m 
      test-remify-methods.R.........   36 tests [0;32mOK[0m 
      test-remify-methods.R.........   37 tests [0;32mOK[0m 
      test-remify-methods.R.........   38 tests [0;32mOK[0m 
      test-remify-methods.R.........   39 tests [0;32mOK[0m 
      test-remify-methods.R.........   40 tests [0;32mOK[0m 
      test-remify-methods.R.........   41 tests [0;32mOK[0m 
      test-remify-methods.R.........   42 tests [0;32mOK[0m 
      test-remify-methods.R.........   43 tests [0;32mOK[0m 
      test-remify-methods.R.........   44 tests [0;32mOK[0m 
      test-remify-methods.R.........   45 tests [0;32mOK[0m 
      test-remify-methods.R.........   46 tests [0;32mOK[0m 
      test-remify-methods.R.........   47 tests [0;32mOK[0m 
      test-remify-methods.R.........   48 tests [0;32mOK[0m 
      test-remify-methods.R.........   49 tests [0;32mOK[0m 
      test-remify-methods.R.........   49 tests [0;32mOK[0m 
      test-remify-methods.R.........   50 tests [0;32mOK[0m 
      test-remify-methods.R.........   51 tests [0;32mOK[0m 
      test-remify-methods.R.........   52 tests [0;32mOK[0m 
      test-remify-methods.R.........   53 tests [0;32mOK[0m 
      test-remify-methods.R.........   54 tests [0;32mOK[0m 
      test-remify-methods.R.........   55 tests [0;32mOK[0m 
      test-remify-methods.R.........   56 tests [0;32mOK[0m 
      test-remify-methods.R.........   57 tests [0;32mOK[0m 
      test-remify-methods.R.........   58 tests [0;32mOK[0m 
      test-remify-methods.R.........   59 tests [0;32mOK[0m 
      test-remify-methods.R.........   60 tests [0;32mOK[0m 
      test-remify-methods.R.........   61 tests [0;32mOK[0m 
      test-remify-methods.R.........   62 tests [0;32mOK[0m 
      test-remify-methods.R.........   63 tests [0;32mOK[0m 
      test-remify-methods.R.........   64 tests [0;32mOK[0m 
      test-remify-methods.R.........   64 tests [0;32mOK[0m 
      test-remify-methods.R.........   65 tests [0;32mOK[0m 
      test-remify-methods.R.........   66 tests [0;32mOK[0m 
      test-remify-methods.R.........   67 tests [0;32mOK[0m 
      test-remify-methods.R.........   68 tests [0;32mOK[0m 
      test-remify-methods.R.........   69 tests [0;32mOK[0m 
      test-remify-methods.R.........   70 tests [0;32mOK[0m 
      test-remify-methods.R.........   71 tests [0;32mOK[0m 
      test-remify-methods.R.........   72 tests [0;32mOK[0m 
      test-remify-methods.R.........   73 tests [0;32mOK[0m 
      test-remify-methods.R.........   74 tests [0;32mOK[0m 
      test-remify-methods.R.........   75 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   77 tests [0;32mOK[0m 
      test-remify-methods.R.........   78 tests [0;32mOK[0m 
      test-remify-methods.R.........   79 tests [0;32mOK[0m 
      test-remify-methods.R.........   80 tests [0;32mOK[0m 
      test-remify-methods.R.........   81 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   83 tests [0;32mOK[0m 
      test-remify-methods.R.........   84 tests [0;32mOK[0m 
      test-remify-methods.R.........   85 tests [0;32mOK[0m 
      test-remify-methods.R.........   86 tests [0;32mOK[0m 
      test-remify-methods.R.........   87 tests [0;32mOK[0m 
      test-remify-methods.R.........   88 tests [0;32mOK[0m 
      test-remify-methods.R.........   89 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   91 tests [0;32mOK[0m 
      test-remify-methods.R.........   91 tests [0;32mOK[0m 
      test-remify-methods.R.........   92 tests [0;31m1 fails[0m 
      test-remify-methods.R.........   93 tests [0;31m2 fails[0m 
      test-remify-methods.R.........   94 tests [0;31m3 fails[0m 
      test-remify-methods.R.........   95 tests [0;31m4 fails[0m 
      test-remify-methods.R.........   96 tests [0;31m5 fails[0m 
      test-remify-methods.R.........   97 tests [0;31m6 fails[0m 
      test-remify-methods.R.........   98 tests [0;31m7 fails[0m 
      test-remify-methods.R.........   98 tests [0;31m7 fails[0m 
      test-remify-methods.R.........   99 tests [0;31m8 fails[0m 
      test-remify-methods.R.........  100 tests [0;31m9 fails[0m 
      test-remify-methods.R.........  101 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  101 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  102 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  103 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  104 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  105 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  106 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  108 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  113 tests [0;31m10 fails[0m [0;34m9.6s[0m
      
      test-remify-warning-messages.R    0 tests    
      test-remify-warning-messages.R    0 tests    
      test-remify-warning-messages.R    1 tests [0;32mOK[0m 
      test-remify-warning-messages.R    1 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    8 tests [0;32mOK[0m 
      test-remify-warning-messages.R    9 tests [0;32mOK[0m 
      test-remify-warning-messages.R    9 tests [0;32mOK[0m 
      test-remify-warning-messages.R   10 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   12 tests [0;32mOK[0m 
      test-remify-warning-messages.R   13 tests [0;32mOK[0m 
      test-remify-warning-messages.R   13 tests [0;32mOK[0m 
      test-remify-warning-messages.R   14 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   16 tests [0;32mOK[0m 
      test-remify-warning-messages.R   17 tests [0;32mOK[0m 
      test-remify-warning-messages.R   17 tests [0;32mOK[0m 
      test-remify-warning-messages.R   18 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   20 tests [0;32mOK[0m 
      test-remify-warning-messages.R   21 tests [0;32mOK[0m 
      test-remify-warning-messages.R   21 tests [0;32mOK[0m 
      test-remify-warning-messages.R   22 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   24 tests [0;32mOK[0m 
      test-remify-warning-messages.R   25 tests [0;32mOK[0m 
      test-remify-warning-messages.R   25 tests [0;32mOK[0m 
      test-remify-warning-messages.R   26 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   28 tests [0;32mOK[0m 
      test-remify-warning-messages.R   29 tests [0;32mOK[0m 
      test-remify-warning-messages.R   29 tests [0;32mOK[0m 
      test-remify-warning-messages.R   30 tests [0;32mOK[0m 
      test-remify-warning-messages.R   31 tests [0;32mOK[0m [0;34m0.6s[0m
      
      test-remify.R.................    0 tests    
      test-remify.R.................    1 tests [0;32mOK[0m 
      test-remify.R.................    2 tests [0;32mOK[0m 
      test-remify.R.................    3 tests [0;32mOK[0m 
      test-remify.R.................    4 tests [0;32mOK[0m 
      test-remify.R.................    5 tests [0;32mOK[0m 
      test-remify.R.................    6 tests [0;32mOK[0m 
      test-remify.R.................    7 tests [0;32mOK[0m 
      test-remify.R.................    8 tests [0;32mOK[0m 
      test-remify.R.................    9 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   11 tests [0;32mOK[0m 
      test-remify.R.................   12 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   14 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   16 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   18 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   20 tests [0;32mOK[0m 
      test-remify.R.................   20 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   22 tests [0;32mOK[0m 
      test-remify.R.................   22 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   24 tests [0;32mOK[0m 
      test-remify.R.................   24 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   28 tests [0;32mOK[0m 
      test-remify.R.................   29 tests [0;32mOK[0m 
      test-remify.R.................   30 tests [0;32mOK[0m 
      test-remify.R.................   30 tests [0;32mOK[0m 
      test-remify.R.................   31 tests [0;32mOK[0m 
      test-remify.R.................   31 tests [0;32mOK[0m 
      test-remify.R.................   32 tests [0;32mOK[0m 
      test-remify.R.................   32 tests [0;32mOK[0m 
      test-remify.R.................   33 tests [0;32mOK[0m 
      test-remify.R.................   33 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   35 tests [0;32mOK[0m 
      test-remify.R.................   35 tests [0;32mOK[0m 
      test-remify.R.................   36 tests [0;32mOK[0m 
      test-remify.R.................   37 tests [0;32mOK[0m 
      test-remify.R.................   38 tests [0;32mOK[0m 
      test-remify.R.................   39 tests [0;32mOK[0m 
      test-remify.R.................   40 tests [0;32mOK[0m 
      test-remify.R.................   41 tests [0;32mOK[0m 
      test-remify.R.................   42 tests [0;32mOK[0m 
      test-remify.R.................   43 tests [0;32mOK[0m 
      test-remify.R.................   44 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   46 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   48 tests [0;32mOK[0m 
      test-remify.R.................   49 tests [0;32mOK[0m 
      test-remify.R.................   49 tests [0;32mOK[0m 
      test-remify.R.................   50 tests [0;32mOK[0m 
      test-remify.R.................   51 tests [0;32mOK[0m 
      test-remify.R.................   51 tests [0;32mOK[0m 
      test-remify.R.................   52 tests [0;32mOK[0m 
      test-remify.R.................   53 tests [0;32mOK[0m 
      test-remify.R.................   53 tests [0;32mOK[0m 
      test-remify.R.................   54 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   56 tests [0;32mOK[0m 
      test-remify.R.................   56 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   58 tests [0;32mOK[0m 
      test-remify.R.................   58 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   60 tests [0;32mOK[0m 
      test-remify.R.................   60 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   62 tests [0;32mOK[0m 
      test-remify.R.................   62 tests [0;32mOK[0m 
      test-remify.R.................   63 tests [0;32mOK[0m [0;34m0.7s[0m
      ----- FAILED[xcpt]: test-remify-methods.R<349--349>
       call| expect_silent(plot(x = out))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<350--350>
       call| expect_silent(plot(x = out, breaks = NULL, palette = NULL, n_intervals = NULL, 
       call| -->    rev = NULL, actors = NULL, pch.degree = NULL, igraph.edge.color = NULL, 
       call| -->    igraph.vertex.color = NULL))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<351--351>
       call| expect_silent(plot(x = out, pch.degree = -1))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<352--352>
       call| expect_silent(plot(x = out, igraph.edge.color = "#000000000", 
       call| -->    igraph.vertex.color = "#000000000"))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<353--353>
       call| expect_silent(plot(x = out, igraph.edge.color = "magenta", igraph.vertex.color = "cyan4"))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<354--354>
       call| expect_silent(plot(x = out, n_intervals = 5))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<355--355>
       call| expect_silent(plot(x = out, actors = attr(out, "dictionary")$actors$actorName[1:5]))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<362--362>
       call| expect_silent(plot(x = out))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<363--363>
       call| expect_silent(plot(x = out, n_intervals = 5))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      ----- FAILED[xcpt]: test-remify-methods.R<364--364>
       call| expect_silent(plot(x = out, actors = attr(out, "dictionary")$actors$actorName[1:5]))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'is.na() applied to non-(list or vector) of type 'closure''
      Error: 10 out of 254 tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.2Mb
      sub-directories of 1Mb or more:
        doc    3.5Mb
        libs   4.8Mb
    ```

# SEMID

<details>

* Version: 0.4.1
* GitHub: https://github.com/Lucaweihs/SEMID
* Source code: https://github.com/cran/SEMID
* Date/Publication: 2023-07-19 14:00:11 UTC
* Number of recursive dependencies: 33

Run `revdepcheck::cloud_details(, "SEMID")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SEMID-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: SEMID-package
    > ### Title: SEMID package documentation.
    > ### Aliases: SEMID-package SEMID
    > 
    > ### ** Examples
    > 
    > ###
    > # Checking the generic identifiability of parameters in a mixed graph.
    > ###
    > 
    > # Mixed graphs are specified by their directed adjacency matrix L and
    > # bidirected adjacency matrix O.
    > L = t(matrix(
    +  c(0, 1, 1, 0, 0,
    +    0, 0, 1, 1, 1,
    +    0, 0, 0, 1, 0,
    +    0, 0, 0, 0, 1,
    +    0, 0, 0, 0, 0), 5, 5))
    > 
    > O = t(matrix(
    +  c(0, 0, 0, 1, 0,
    +    0, 0, 1, 0, 1,
    +    0, 0, 0, 0, 0,
    +    0, 0, 0, 0, 0,
    +    0, 0, 0, 0, 0), 5, 5)); O=O+t(O)
    > 
    > # Create a mixed graph object
    > graph = MixedGraph(L, O)
    > 
    > # We can plot what this mixed graph looks like, blue edges are directed
    > # red edges are bidirected.
    > plot(graph)
    > 
    > # Without using decomposition techniques we can't identify all nodes
    > # just using the half-trek criterion
    > htcID(graph, tianDecompose = FALSE)
    Warning: The `vp` argument of `get_edge_ids()` supplied as a matrix should be a n times
    2 matrix, not 2 times n as of igraph 2.1.5.
    ℹ either transpose the matrix with t() or convert it to a data.frame with two
      columns.
    ℹ The deprecated feature was likely used in the igraph package.
      Please report the issue at <https://github.com/igraph/rigraph/issues>.
    Call: htcID(mixedGraph = graph, tianDecompose = FALSE)
    
    Mixed Graph Info.
    # nodes: 5 
    # dir. edges: 7 
    # bi. edges: 3 
    
    Generic Identifiability Summary
    # dir. edges shown gen. identifiable: 1 
    # bi. edges shown gen. identifiable: 0 
    
    Generically identifiable dir. edges:
    1->2 
    
    Generically identifiable bi. edges:
    None
    > 
    > # The edgewiseTSID function can show that all edges are generically
    > # identifiable without proprocessing with decomposition techniques
    > edgewiseTSID(graph, tianDecompose = FALSE)
    Error:
    ! The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
    Backtrace:
         ▆
      1. └─SEMID::edgewiseTSID(graph, tianDecompose = FALSE)
      2.   └─SEMID::generalGenericID(...)
      3.     └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
      4.       └─SEMID::trekSeparationIdentifyStep(...)
      5.         └─mixedGraph$getTrekSystem(sources, c(targets, i), avoidRightEdges = toRemoveOnRight)
      6.           ├─SEMID::getTrekSystem(this, ...)
      7.           └─SEMID:::getTrekSystem.MixedGraph(this, ...)
      8.             └─this$.internalGraph$getTrekSystem(...)
      9.               ├─SEMID::getTrekSystem(this, ...)
     10.               └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
     11.                 └─this$.internalGraph$getTrekSystem(...)
     12.                   ├─SEMID::getTrekSystem(this, ...)
     13.                   └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
     14.                     └─this$.trekFlowGraph$updateEdgeCapacities(...)
     15.                       ├─SEMID::updateEdgeCapacities(this, ...)
     16.                       └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
     17.                         └─igraph::get.edge.ids(...)
     18.                           └─igraph::get_edge_ids(...)
     19.                             └─igraph:::el_to_vec(vp, call = rlang::caller_env())
     20.                               └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
     21.                                 └─lifecycle:::deprecate_stop0(msg)
     22.                                   └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(SEMID)
      > 
      > test_check("SEMID")
      [ FAIL 7 | WARN 11 | SKIP 0 | PASS 965 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_LatentDigraph.R:67:3'): Single node graph works properly ───────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test_LatentDigraph.R:67:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─g$getTrekSystem(1, 1)
        5.   ├─SEMID::getTrekSystem(this, ...)
        6.   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
        7.     └─this$.internalGraph$getTrekSystem(...)
        8.       ├─SEMID::getTrekSystem(this, ...)
        9.       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       10.         └─this$createTrekFlowGraph()
       11.           ├─SEMID::createTrekFlowGraph(this, ...)
       12.           └─SEMID:::createTrekFlowGraph.LatentDigraphFixedOrder(this, ...)
       13.             └─SEMID::FlowGraph(adjMat, 1, adjMat)
       14.               └─igraph::get.edge.ids(flowGraph, rbind(1:m, 1:m + m))
       15.                 └─igraph::get_edge_ids(...)
       16.                   └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       17.                     └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       18.                       └─lifecycle:::deprecate_stop0(msg)
       19.                         └─rlang::cnd_signal(...)
      ── Error ('test_ancestral.R:19:17'): Ancestral identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::ancestralID(g) at test_ancestral.R:19:17
        2.   └─SEMID::generalGenericID(...)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─tianAncGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_ancestral.R:44:17'): Old and new ancestralID implementations agree. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::ancestralID(MixedGraph(L, O)) at test_ancestral.R:44:17
        2.   └─SEMID::generalGenericID(...)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─tianAncGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_edgewiseID.R:18:17'): Edgewise identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::htcID(g) at test_edgewiseID.R:18:17
        2.   └─SEMID::generalGenericID(mixedGraph, list(htcIdentifyStep), tianDecompose = tianDecompose)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─mixedGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_edgewiseID.R:44:9'): TO DELETE ─────────────────────────────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::htcID(g, tianDecompose = F) at test_edgewiseID.R:44:9
        2.   └─SEMID::generalGenericID(mixedGraph, list(htcIdentifyStep), tianDecompose = tianDecompose)
        3.     └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        4.       └─mixedGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        5.         ├─SEMID::getHalfTrekSystem(this, ...)
        6.         └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        7.           └─this$getTrekSystem(...)
        8.             ├─SEMID::getTrekSystem(this, ...)
        9.             └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       10.               └─this$.internalGraph$getTrekSystem(...)
       11.                 ├─SEMID::getTrekSystem(this, ...)
       12.                 └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       13.                   └─this$.internalGraph$getTrekSystem(...)
       14.                     ├─SEMID::getTrekSystem(this, ...)
       15.                     └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       16.                       └─this$.trekFlowGraph$updateEdgeCapacities(...)
       17.                         ├─SEMID::updateEdgeCapacities(this, ...)
       18.                         └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       19.                           └─igraph::get.edge.ids(...)
       20.                             └─igraph::get_edge_ids(...)
       21.                               └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       22.                                 └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       23.                                   └─lifecycle:::deprecate_stop0(msg)
       24.                                     └─rlang::cnd_signal(...)
      ── Error ('test_lfhtcID.R:8:5'): lfhtcID returns correct value for known examples. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::lfhtcID(digraphExamples[[i]]$graph) at test_lfhtcID.R:8:5
        2.   └─SEMID::lfhtcIdentifyStep(...)
        3.     └─graph$getTrekSystem(...)
        4.       ├─SEMID::getTrekSystem(this, ...)
        5.       └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
        6.         └─this$.internalGraph$getTrekSystem(...)
        7.           ├─SEMID::getTrekSystem(this, ...)
        8.           └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
        9.             └─this$.trekFlowGraph$updateEdgeCapacities(...)
       10.               ├─SEMID::updateEdgeCapacities(this, ...)
       11.               └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       12.                 └─igraph::get.edge.ids(...)
       13.                   └─igraph::get_edge_ids(...)
       14.                     └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       15.                       └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       16.                         └─lifecycle:::deprecate_stop0(msg)
       17.                           └─rlang::cnd_signal(...)
      ── Error ('test_trekSepID.R:25:17'): Edgewise identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID (local) trekSepId(MixedGraph(L, O)) at test_trekSepID.R:25:17
        2.   └─SEMID::generalGenericID(mixedGraph, list(tsIdStep)) at test_trekSepID.R:11:5
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─SEMID::trekSeparationIdentifyStep(...) at test_trekSepID.R:8:9
        6.           └─mixedGraph$getTrekSystem(sources, c(targets, i), avoidRightEdges = toRemoveOnRight)
        7.             ├─SEMID::getTrekSystem(this, ...)
        8.             └─SEMID:::getTrekSystem.MixedGraph(this, ...)
        9.               └─this$.internalGraph$getTrekSystem(...)
       10.                 ├─SEMID::getTrekSystem(this, ...)
       11.                 └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       12.                   └─this$.internalGraph$getTrekSystem(...)
       13.                     ├─SEMID::getTrekSystem(this, ...)
       14.                     └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       15.                       └─this$.trekFlowGraph$updateEdgeCapacities(...)
       16.                         ├─SEMID::updateEdgeCapacities(this, ...)
       17.                         └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       18.                           └─igraph::get.edge.ids(...)
       19.                             └─igraph::get_edge_ids(...)
       20.                               └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       21.                                 └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       22.                                   └─lifecycle:::deprecate_stop0(msg)
       23.                                     └─rlang::cnd_signal(...)
      
      [ FAIL 7 | WARN 11 | SKIP 0 | PASS 965 ]
      Error: Test failures
      Execution halted
    ```

# sglasso

<details>

* Version: 1.2.6
* GitHub: NA
* Source code: https://github.com/cran/sglasso
* Date/Publication: 2023-12-03 08:40:02 UTC
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "sglasso")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sglasso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gplot.fglasso
    > ### Title: Plotting Sparse Factorial Dynamic Gaussian Graphical Model
    > ### Aliases: gplot.fglasso
    > ### Keywords: models
    > 
    > ### ** Examples
    > 
    > N <- 50
    > tp <- 3
    > p <- 3
    > X <- matrix(rnorm(N * p * tp), N, tp * p)
    > S <- crossprod(X) / N
    > model <- list(lag0 = c(s = "c", n = "ut"), lag1 = c(s = "t", n = "t"))
    > out.fglasso <- fglasso(S = S, model = model, tp = tp, p = p)
    > gplot(out.fglasso, rhoid = 50, sub.tp1 = "First graph", 
    +    sub.tp2 = "Second graph")
    Error in paste0(before, x, after) : 
      cannot coerce type 'closure' to vector of type 'character'
    Calls: gplot ... ansi_collapse -> collapse_both_ends -> inline_generic -> paste0
    Execution halted
    ```

# simdata

<details>

* Version: 0.4.1
* GitHub: https://github.com/matherealize/simdata
* Source code: https://github.com/cran/simdata
* Date/Publication: 2024-12-03 23:10:07 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "simdata")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Demo.Rmd’ using rmarkdown
    ```

# spatialreg

<details>

* Version: 1.3-6
* GitHub: https://github.com/r-spatial/spatialreg
* Source code: https://github.com/cran/spatialreg
* Date/Publication: 2024-12-02 11:50:02 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "spatialreg")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        R     1.5Mb
        doc   3.2Mb
    ```

# ssifs

<details>

* Version: 1.0.4
* GitHub: https://github.com/georgiosseitidis/ssifs
* Source code: https://github.com/cran/ssifs
* Date/Publication: 2025-02-04 10:50:03 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "ssifs")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ssifs-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Alcohol
    > ### Title: Stochastic Search Inconsistency Factor Selection of brief
    > ###   alcohol interventions.
    > ### Aliases: Alcohol
    > 
    > ### ** Examples
    > 
    > data(Alcohol)
    > 
    > TE <- Alcohol$TE
    > seTE <- Alcohol$seTE
    > studlab <- Alcohol$studyid
    > treat1 <- Alcohol$treat2
    > treat2 <- Alcohol$treat1
    > 
    > # Stochastic Search Inconsistency Factor Selection using as reference treatment AO-CT and the
    > # design-by-treatment method for the specification of the Z matrix.
    > 
    > m <- ssifs(TE, seTE, treat1, treat2, studlab, ref = "AO-CT",
    + M = 1000, B = 100, M_pilot = 1000, B_pilot = 100)
    Error:
    ! The `neimode` argument of `dfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    Backtrace:
         ▆
      1. └─ssifs::ssifs(...)
      2.   └─ssifs:::connet(data)
      3.     └─ssifs:::subnet(data)
      4.       ├─base::suppressWarnings(RevEcoR::KosarajuSCC(t))
      5.       │ └─base::withCallingHandlers(...)
      6.       └─RevEcoR::KosarajuSCC(t)
      7.         └─igraph::graph.dfs(g, root = Source.node, neimode = "out", unreachable = FALSE)
      8.           └─igraph::dfs(...)
      9.             └─lifecycle::deprecate_stop("1.3.0", "dfs(neimode = )", "dfs(mode = )")
     10.               └─lifecycle:::deprecate_stop0(msg)
     11.                 └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘An_introduction_to_ssifs.Rmd’ using rmarkdown
    
    Quitting from An_introduction_to_ssifs.Rmd:132-135 [unnamed-chunk-4]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'An_introduction_to_ssifs.Rmd' failed with diagnostics:
    The `neimode` argument of `dfs()` was deprecated in igraph 1.3.0 and is
    now defunct.
    ℹ Please use the `mode` argument instead.
    --- failed re-building ‘An_introduction_to_ssifs.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘An_introduction_to_ssifs.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tilemaps

<details>

* Version: 0.2.0
* GitHub: https://github.com/kaerosen/tilemaps
* Source code: https://github.com/cran/tilemaps
* Date/Publication: 2020-07-10 04:20:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "tilemaps")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tilemaps-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: create_island
    > ### Title: Create a Tile for an Island
    > ### Aliases: create_island
    > 
    > ### ** Examples
    > 
    > library(sf)
    Linking to GEOS 3.12.1, GDAL 3.8.4, PROJ 9.4.0; sf_use_s2() is TRUE
    > northeast <- governors[c(6,7,17,18,19,27,28,30,36,37,43),]
    > tile_map <- generate_map(northeast$geometry, square = FALSE)
    Error:
    ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    Backtrace:
        ▆
     1. └─tilemaps::generate_map(northeast$geometry, square = FALSE)
     2.   └─igraph::bfs(neighbor_graph, 1, neimode = "all", unreachable = FALSE)
     3.     └─lifecycle::deprecate_stop("1.3.0", "bfs(neimode = )", "bfs(mode = )")
     4.       └─lifecycle:::deprecate_stop0(msg)
     5.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tilemaps.Rmd’ using rmarkdown
    
    Quitting from tilemaps.Rmd:32-41 [unnamed-chunk-2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'tilemaps.Rmd' failed with diagnostics:
    ℹ In argument: `tile_map = generate_map(geometry, square = FALSE,
      flat_topped = TRUE)`.
    Caused by error:
    ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    --- failed re-building ‘tilemaps.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tilemaps.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lwgeom’
      All declared Imports should be used.
    ```

# wpa

<details>

* Version: 1.9.1
* GitHub: https://github.com/microsoft/wpa
* Source code: https://github.com/cran/wpa
* Date/Publication: 2024-06-06 13:20:02 UTC
* Number of recursive dependencies: 120

Run `revdepcheck::cloud_details(, "wpa")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wpa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network_p2p
    > ### Title: Perform network analysis with the person-to-person query
    > ### Aliases: network_p2p
    > 
    > ### ** Examples
    > 
    > p2p_df <- p2p_data_sim(dim = 1, size = 100)
    > 
    > # default - ggraph visual
    > network_p2p(data = p2p_df, style = "ggraph")
    > 
    > # return vertex table
    > network_p2p(data = p2p_df, return = "table")
    # A tibble: 6 × 2
      Organization     n
      <chr>        <int>
    1 Org A           14
    2 Org B           14
    3 Org C           15
    4 Org D           11
    5 Org E           12
    6 Org F           34
    > 
    > # return vertex table with community detection
    > network_p2p(data = p2p_df, community = "leiden", return = "table")
    # A tibble: 100 × 3
       Organization cluster     n
       <chr>        <chr>   <int>
     1 Org A        12          1
     2 Org A        25          1
     3 Org A        32          1
     4 Org A        38          1
     5 Org A        44          1
     6 Org A        51          1
     7 Org A        58          1
     8 Org A        6           1
     9 Org A        65          1
    10 Org A        71          1
    # ℹ 90 more rows
    > 
    > # leiden - igraph style with custom resolution parameters
    > network_p2p(data = p2p_df, community = "leiden", comm_args = list("resolution" = 0.1))
    Error in vapply(.x, .f, .mold, ..., USE.NAMES = FALSE) : 
      values must be length 1,
     but FUN(X[[1]]) result is length 0
    Calls: network_p2p ... i.get.arrow.mode -> map_dbl -> .rlang_purrr_map_mold -> vapply
    Execution halted
    ```

