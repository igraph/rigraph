# CePa

<details>

* Version: 0.8.0
* GitHub: https://github.com/jokergoo/CePa
* Source code: https://github.com/cran/CePa
* Date/Publication: 2022-06-11 21:30:06 UTC
* Number of recursive dependencies: 14

Run `revdepcheck::cloud_details(, "CePa")` for more info

</details>

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'cepa.Rd':
      ‘[igraph:igraph_test]{igraphtest}’
    
    Missing link or links in documentation object 'cepa.ora.Rd':
      ‘[igraph:igraph_test]{igraphtest}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘CePa.Rnw’ using Sweave
    Error: processing vignette 'CePa.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'CePa.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `grfext.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    
    ...
    l.179   \RequirePackage{grfext}\relax
                                         ^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘parsing-PID-pathway-data.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘CePa.Rnw’ ‘analysis-p53.Rnw’ ‘parsing-PID-pathway-data.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# manynet

<details>

* Version: 1.0.5
* GitHub: https://github.com/stocnet/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2024-08-30 04:50:02 UTC
* Number of recursive dependencies: 147

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

