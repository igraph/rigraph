# manynet

<details>

* Version: 1.2.6
* GitHub: https://github.com/stocnet/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2024-10-05 16:40:01 UTC
* Number of recursive dependencies: 146

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
      [ FAIL 7 | WARN 18643 | SKIP 21 | PASS 558 ]
      
    ...
      `expected`: 0.2 0.1 0.1
      ── Failure ('test-measure_centrality.R:79:3'): two mode eigenvector centrality calculated correctly ──
      top3(node_eigenvector(test_igr, normalized = TRUE)) (`actual`) not equal to c(0.4505, 0.4248, 0.5) (`expected`).
      
        `actual`: 1.3 1.2 1.4
      `expected`: 0.5 0.4 0.5
      
      [ FAIL 7 | WARN 18643 | SKIP 21 | PASS 558 ]
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
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        R           1.5Mb
        tutorials   1.8Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 7 marked UTF-8 strings
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
      ℹ Please use `as_directed()` instead. 
      2: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      3: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      4: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      5: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
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
      [ FAIL 1 | WARN 25 | SKIP 4 | PASS 69 ]
      
      ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
    ...
       14. │   └─base::lapply(args, rlang::eval_tidy, data = data_mask)
       15. │     └─rlang (local) FUN(X[[i]], ...)
       16. └─igraph (local) from(V(x)[y])
       17.   └─lifecycle::deprecate_stop("2.1.0", "from()", ".from()")
       18.     └─lifecycle:::deprecate_stop0(msg)
       19.       └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 25 | SKIP 4 | PASS 69 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘maps’
      All declared Imports should be used.
    ```

