# causaleffect

<details>

* Version: 1.3.15
* GitHub: https://github.com/santikka/causaleffect
* Source code: https://github.com/cran/causaleffect
* Date/Publication: 2022-07-14 09:10:05 UTC
* Number of recursive dependencies: 17

Run `revdepcheck::cloud_details(, "causaleffect")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘causaleffect.ltx’ using tex
    Error: processing vignette 'causaleffect.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'causaleffect.ltx' failed.
    LaTeX errors:
    ! LaTeX Error: File `thumbpdf.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    
    ...
    l.16 \usepackage
                    {csquotes}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘simplification.ltx’
    
    SUMMARY: processing the following files failed:
      ‘causaleffect.ltx’ ‘simplification.ltx’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# CINNA

<details>

* Version: 1.2.2
* GitHub: NA
* Source code: https://github.com/cran/CINNA
* Date/Publication: 2023-08-08 16:40:02 UTC
* Number of recursive dependencies: 149

Run `revdepcheck::cloud_details(, "CINNA")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘circlize’ ‘utils’
      All declared Imports should be used.
    ```

# dosearch

<details>

* Version: 1.0.8
* GitHub: NA
* Source code: https://github.com/cran/dosearch
* Date/Publication: 2021-08-19 16:40:02 UTC
* Number of recursive dependencies: 18

Run `revdepcheck::cloud_details(, "dosearch")` for more info

</details>

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        libs   6.2Mb
    ```

# ggnetwork

<details>

* Version: 0.5.12
* GitHub: https://github.com/briatte/ggnetwork
* Source code: https://github.com/cran/ggnetwork
* Date/Publication: 2023-03-06 20:00:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "ggnetwork")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘sna’ ‘utils’
      All declared Imports should be used.
    ```

# inferCSN

<details>

* Version: 0.99.8
* GitHub: https://github.com/mengxu98/inferCSN
* Source code: https://github.com/cran/inferCSN
* Date/Publication: 2023-12-04 05:00:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "inferCSN")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 35.6Mb
      sub-directories of 1Mb or more:
        libs  34.6Mb
    ```

# influential

<details>

* Version: 2.2.8
* GitHub: https://github.com/asalavaty/influential
* Source code: https://github.com/cran/influential
* Date/Publication: 2023-11-19 05:10:02 UTC
* Number of recursive dependencies: 196

Run `revdepcheck::cloud_details(, "influential")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... WARNING
    ```
    '::' or ':::' import not declared from: ‘lifecycle’
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    Codoc mismatches from documentation object 'graph_from_incidence_matrix':
    graph_from_incidence_matrix
      Code: function(...)
      Docs: function(incidence, directed = FALSE, mode = c("all", "out",
                     "in", "total"), multiple = FALSE, weighted = NULL,
                     add.names = NULL)
      Argument names in code not in docs:
        ...
      Argument names in docs not in code:
        incidence directed mode multiple weighted add.names
      Mismatches in argument names:
        Position: 1 Code: ... Docs: incidence
    ```

# markovchain

<details>

* Version: 0.9.5
* GitHub: https://github.com/spedygiorgio/markovchain
* Source code: https://github.com/cran/markovchain
* Date/Publication: 2023-09-24 09:20:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "markovchain")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘an_introduction_to_markovchain_package.Rmd’ using rmarkdown
    Error: processing vignette 'an_introduction_to_markovchain_package.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘an_introduction_to_markovchain_package.Rmd’
    
    --- re-building ‘gsoc_2017_additions.Rmd’ using rmarkdown
    --- finished re-building ‘gsoc_2017_additions.Rmd’
    
    ...
    Error: processing vignette 'higher_order_markov_chains.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘higher_order_markov_chains.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘an_introduction_to_markovchain_package.Rmd’
      ‘higher_order_markov_chains.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘etm’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 24.0Mb
      sub-directories of 1Mb or more:
        libs  21.9Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# pcalg

<details>

* Version: 2.7-9
* GitHub: NA
* Source code: https://github.com/cran/pcalg
* Date/Publication: 2023-09-26 05:40:03 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "pcalg")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 20.0Mb
      sub-directories of 1Mb or more:
        data   2.1Mb
        libs  14.6Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘combinat’, ‘unifDAG’
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘vignette2018.Rnw’ using Sweave
    Loading required package: Rgraphviz
    Loading required package: graph
    Loading required package: BiocGenerics
    
    Attaching package: 'BiocGenerics'
    
    The following objects are masked from 'package:stats':
    
    ...
    l.179   \RequirePackage{grfext}\relax
                                         ^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building 'vignette2018.Rnw'
    
    SUMMARY: processing the following file failed:
      'vignette2018.Rnw'
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# phyloseqGraphTest

<details>

* Version: 0.1.0
* GitHub: https://github.com/jfukuyama/phyloseqGraphTest
* Source code: https://github.com/cran/phyloseqGraphTest
* Date/Publication: 2020-02-07 16:30:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "phyloseqGraphTest")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘intergraph’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# shazam

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/shazam
* Date/Publication: 2023-10-02 18:50:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "shazam")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Baseline-Vignette.Rmd’ using rmarkdown
    tlmgr update --all --self
    Can't locate mktexlsr.pl in @INC (@INC contains: /opt/TinyTeX/tlpkg /opt/TinyTeX/texmf-dist/scripts/texlive /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.30.0 /usr/local/share/perl/5.30.0 /usr/lib/x86_64-linux-gnu/perl5/5.30 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.30 /usr/share/perl/5.30 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at /usr/bin/fmtutil line 26.
    BEGIN failed--compilation aborted at /usr/bin/fmtutil line 28.
    texlive-scripts package not found (?!), skipping revision consistency check
    tlmgr: package repository https://ctan.math.illinois.edu/systems/texlive/tlnet (verified)
    tlmgr install: package already present: l3backend
    ! LaTeX Error: Mismatched LaTeX support files detected.
    (LaTeX)        Loading 'l3backend-pdftex.def' aborted!
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

# statGraph

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/statGraph
* Date/Publication: 2021-05-19 07:00:06 UTC
* Number of recursive dependencies: 20

Run `revdepcheck::cloud_details(, "statGraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘statGraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tang.test
    > ### Title: Tang hypothesis testing for random graphs.
    > ### Aliases: tang.test
    > 
    > ### ** Examples
    > 
    > set.seed(42)
    ...
    > ## test under H0
    > lpvs <- matrix(rnorm(200), 20, 10)
    > lpvs <- apply(lpvs, 2, function(x) { return (abs(x)/sqrt(sum(x^2))) })
    > G1 <- igraph::sample_dot_product(lpvs)
    > G2 <- igraph::sample_dot_product(lpvs)
    > D1 <- tang.test(G1, G2, 5)
    Error in defaults$maxiter <- .Machine$integer.max : 
      object of type 'closure' is not subsettable
    Calls: tang.test -> t.embed.graph
    Execution halted
    ```

