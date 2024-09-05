# isotracer

<details>

* Version: 1.1.6
* GitHub: NA
* Source code: https://github.com/cran/isotracer
* Date/Publication: 2024-05-15 08:50:07 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "isotracer")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(isotracer)
      To automatically run isotracer in parallel on a multicore CPU, you can call:
        options(mc.cores = parallel::detectCores())
      
      
      Attaching package: 'isotracer'
    ...
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-steady-states-flows-pred.R:481:5'): Predictions for open network, single unit, one steady, one split ──
      all(x[["from"]] - x[["to"]] < 1e-13) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 582 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking whether package ‘isotracer’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: namespace ‘lubridate’ is not available and has been replaced
    See ‘/tmp/workdir/isotracer/new/isotracer.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 95.1Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        data   4.0Mb
        doc    2.3Mb
        libs  86.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rstantools’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# manynet

<details>

* Version: 1.0.5
* GitHub: https://github.com/stocnet/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2024-08-30 04:50:02 UTC
* Number of recursive dependencies: 152

Run `revdepcheck::cloud_details(, "manynet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘manynet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_generate
    > ### Title: Making networks with a stochastic element
    > ### Aliases: make_generate generate_random generate_configuration
    > ###   generate_smallworld generate_scalefree generate_utilities
    > ###   generate_fire generate_islands generate_citations
    > ###   generate_permutation
    > 
    ...
    3     3     4
    4     3     5
    5     4     6
    6     6     7
    # ℹ 3 more rows
    > generate_islands(10)
    Error in igraph::sample_islands(islands.n = islands, islands.size = c(table(cut(seq.int(n),  : 
      At rinterface_extra.c:78 : Expecting a scalar integer but received a vector of length 2. Invalid value
    Calls: generate_islands -> <Anonymous>
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘Rgraphviz’
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
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "MetaNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MetaNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: anno_vertex
    > ### Title: Use data.frame to annotate vertexes of metanet
    > ### Aliases: anno_vertex anno_node
    > 
    > ### ** Examples
    > 
    > data("c_net")
    ...
      8. │           └─igraph (local) x("width", no = can_max)
      9. │             ├─igraph::ends(x, edges[seq_len(no)], names = names)
     10. │             │ ├─igraph:::as_igraph_es(graph, na.omit(es))
     11. │             │ └─stats::na.omit(es)
     12. │             ├─edges[seq_len(no)]
     13. │             └─igraph:::`[.igraph.es`(edges, seq_len(no))
     14. │               └─base::lapply(...)
     15. │                 └─rlang (local) FUN(X[[i]], ...)
     16. └─rlang::abort(message = message)
    Execution halted
    ```

# netropy

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/netropy
* Date/Publication: 2022-02-02 08:20:02 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "netropy")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netropy-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: assoc_graph
    > ### Title: Association Graphs
    > ### Aliases: assoc_graph
    > 
    > ### ** Examples
    > 
    > library(ggraph)
    ...
    +                 ifelse(df.att$age<=45,1,2)),
    +    practice = df.att$practice,
    +    lawschool= df.att$lawschool-1)
    > 
    > # association graph based on cutoff 0.15
    > assoc_graph(df.att.ed, 0.15)
    Error in igraph::distances(g) : 
      At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    Calls: assoc_graph ... layout_with_stress -> .layout_with_stress_dim -> <Anonymous>
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘joint_entropies.Rmd’
      ...
    21    0         4        45
    
    > library(ggraph)
    Loading required package: ggplot2
    
    > assoc_graph(dyad.var, 0.15)
    
      When sourcing ‘joint_entropies.R’:
    Error: At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    Execution halted
    
      ‘joint_entropies.Rmd’ using ‘UTF-8’... failed
      ‘prediction_power.Rmd’ using ‘UTF-8’... OK
      ‘univariate_bivariate_trivariate.Rmd’ using ‘UTF-8’... OK
      ‘variable_domains.Rmd’ using ‘UTF-8’... OK
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘joint_entropies.Rmd’ using rmarkdown
    
    Quitting from lines 96-98 [assoc_g] (joint_entropies.Rmd)
    Error: processing vignette 'joint_entropies.Rmd' failed with diagnostics:
    At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    --- failed re-building ‘joint_entropies.Rmd’
    
    --- re-building ‘prediction_power.Rmd’ using rmarkdown
    ...
    --- finished re-building ‘univariate_bivariate_trivariate.Rmd’
    
    --- re-building ‘variable_domains.Rmd’ using rmarkdown
    --- finished re-building ‘variable_domains.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘joint_entropies.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# R6causal

<details>

* Version: 0.8.3
* GitHub: NA
* Source code: https://github.com/cran/R6causal
* Date/Publication: 2024-03-14 16:10:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "R6causal")` for more info

</details>

## Newly broken

*   checking whether package ‘R6causal’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Note: possible error in '.to(l[i])': unused argument (l[i]) 
      Note: possible error in '.from(l[i])': unused argument (l[i]) 
    See ‘/tmp/workdir/R6causal/new/R6causal.Rcheck/00install.out’ for details.
    Information on the location(s) of code generating the ‘Note’s can be
    obtained by re-running with environment variable R_KEEP_PKG_SOURCE set
    to ‘yes’.
    ```

# simcausal

<details>

* Version: 0.5.6
* GitHub: https://github.com/osofr/simcausal
* Source code: https://github.com/cran/simcausal
* Date/Publication: 2022-10-28 11:52:27 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "simcausal")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > ## unit tests will not be done if RUnit is not available
      > # setwd("..")
      > # getwd()
      > # library(RUnit)
      > if(require("RUnit", quietly=TRUE)) {
      +     ## --- Setup ---
      + 
    ...
      In addition: Warning messages:
      1: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      2: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      3: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      4: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘simcausal_vignette.Rnw’ using knitr
    Error: processing vignette 'simcausal_vignette.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'simcausal_vignette.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `colortbl.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.55 \RequirePackage
                        [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘simcausal_vignette.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘simcausal_vignette.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# skynet

<details>

* Version: 1.4.3
* GitHub: https://github.com/ropensci/skynet
* Source code: https://github.com/cran/skynet
* Date/Publication: 2022-06-17 13:00:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "skynet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(skynet)
      > 
      > test_check("skynet")
      [ FAIL 1 | WARN 24 | SKIP 4 | PASS 69 ]
      
      ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
    ...
       14. │   └─base::lapply(...)
       15. │     └─rlang (local) FUN(X[[i]], ...)
       16. └─igraph (local) from(V(x)[y])
       17.   └─lifecycle::deprecate_stop("2.0.4", "from()", ".from()")
       18.     └─lifecycle:::deprecate_stop0(msg)
       19.       └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 24 | SKIP 4 | PASS 69 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘maps’
      All declared Imports should be used.
    ```

