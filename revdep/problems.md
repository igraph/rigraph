# bipartite

<details>

* Version: 2.19
* GitHub: https://github.com/biometry/bipartite
* Source code: https://github.com/cran/bipartite
* Date/Publication: 2023-11-30 16:40:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "bipartite")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bipartite-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: closeness_w
    > ### Title: Closeness centrality in a weighted network
    > ### Aliases: closeness_w
    > 
    > ### ** Examples
    > 
    > ## Load sample data
    ...
    + c(5,2,2),
    + c(5,6,1),
    + c(6,5,1))
    > 
    > ## Run the programme
    > closeness_w(sampledata)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: closeness_w ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Intro2bipartite.Rnw’ using Sweave
    Loading required package: vegan
    Loading required package: permute
    Loading required package: lattice
    This is vegan 2.6-4
    Loading required package: sna
    Loading required package: statnet.common
    
    Attaching package: ‘statnet.common’
    
    The following objects are masked from ‘package:base’:
    
        attr, order
    
    Loading required package: network
    
    ‘network’ 1.18.2 (2023-12-04), part of the Statnet Project
    ```

# bootnet

<details>

* Version: 1.5.6
* GitHub: NA
* Source code: https://github.com/cran/bootnet
* Date/Publication: 2023-10-04 15:10:12 UTC
* Number of recursive dependencies: 196

Run `revdepcheck::cloud_details(, "bootnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bootnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bootnet
    > ### Title: Bootstrapped network estimation
    > ### Aliases: bootnet
    > 
    > ### ** Examples
    > 
    > # BFI Extraversion data from psychTools package:
    ...
    Warning in EBICglassoCore(S = S, n = n, gamma = gamma, penalize.diagonal = penalize.diagonal,  :
      A dense regularized network was selected (lambda < 0.1 * lambda.max). Recent work indicates a possible drop in specificity. Interpret the presence of the smallest edges with care. Setting threshold = TRUE will enforce higher specificity, at the cost of sensitivity.
    > 
    > # Centrality indices:
    > library("qgraph")
    > centralityPlot(Network)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: centralityPlot ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# CARBayes

<details>

* Version: 6.1
* GitHub: https://github.com/duncanplee/CARBayes
* Source code: https://github.com/cran/CARBayes
* Date/Publication: 2023-11-17 11:40:11 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "CARBayes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CARBayes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: S.RAB
    > ### Title: Fit a spatial generalised linear model with anisotropic basis
    > ###   functions to data for computationally efficient localised spatial
    > ###   smoothing, where the parameters are estimated by penalised maximum
    > ###   likelihood estimation with a ridge regression penalty.
    > ### Aliases: S.RAB
    > 
    ...
    > V <- rnorm(n=K, mean=phi + 0.4*groups , sd=rep(0.05,K))
    > 
    > #### Run the RAB model
    > mod <- S.RAB(formula=Y~x1+x2, family="binomial", data=NULL, trials=trials, W=W, 
    +         V=V, nlambda=50, verbose=TRUE)
    Setting up the model.
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: S.RAB ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        libs   3.6Mb
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘CARBayes.Rnw’ using Sweave
    Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1; sf_use_s2() is TRUE
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    ...
    l.179   \RequirePackage{grfext}\relax
                                         ^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘CARBayes.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘CARBayes.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# Cascade

<details>

* Version: 2.1
* GitHub: https://github.com/fbertran/Cascade
* Source code: https://github.com/cran/Cascade
* Date/Publication: 2022-11-28 12:30:06 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "Cascade")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Cascade-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: analyze_network,network-method
    > ### Title: Analysing the network
    > ### Aliases: analyze_network,network-method analyze_network
    > ###   analyze_network-methods
    > ### Keywords: methods
    > 
    > ### ** Examples
    ...
    
        union
    
    Loading required package: survival
    tnet: Analysis of Weighted, Two-mode, and Longitudinal networks.
    Type ?tnet for help.
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: analyze_network ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# centiserve

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/centiserve
* Date/Publication: 2017-07-15 09:34:41 UTC
* Number of recursive dependencies: 14

Run `revdepcheck::cloud_details(, "centiserve")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘centiserve-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: averagedis
    > ### Title: Find the average distance of a node
    > ### Aliases: averagedis
    > 
    > ### ** Examples
    > 
    > g <- graph(c(1,2,2,3,3,4,4,2), directed=FALSE)
    > averagedis(g)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: averagedis ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# CePa

<details>

* Version: 0.8.0
* GitHub: https://github.com/jokergoo/CePa
* Source code: https://github.com/cran/CePa
* Date/Publication: 2022-06-11 21:30:06 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "CePa")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CePa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: radiality
    > ### Title: Calculate radiality centrality
    > ### Aliases: radiality
    > 
    > ### ** Examples
    > 
    > require(igraph)
    ...
        union
    
    > pathway = barabasi.game(200)
    Warning: `barabasi.game()` was deprecated in igraph 2.0.0.
    ℹ Please use `sample_pa()` instead.
    > radiality(pathway)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: radiality ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
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

# CINNA

<details>

* Version: 1.2.2
* GitHub: NA
* Source code: https://github.com/cran/CINNA
* Date/Publication: 2023-08-08 16:40:02 UTC
* Number of recursive dependencies: 149

Run `revdepcheck::cloud_details(, "CINNA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CINNA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: wiener_index_centrality
    > ### Title: Wiener Index Centrality
    > ### Aliases: wiener_index_centrality
    > 
    > ### ** Examples
    > 
    > 
    ...
    > data(zachary)
    > 
    > wiener_index_centrality(zachary)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: wiener_index_centrality ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘circlize’ ‘utils’
      All declared Imports should be used.
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
    
    > ### Name: separation
    > ### Title: A measure of network separation
    > ### Aliases: separation
    > 
    > ### ** Examples
    > 
    > library(DTSEA)
    ...
    +   set_a = c("4", "6", "8", "13"),
    +   set_b = c("8", "9", "10", "15", "18")
    + )
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: separation ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# edmcr

<details>

* Version: 0.2.0
* GitHub: https://github.com/great-northern-diver/edmcr
* Source code: https://github.com/cran/edmcr
* Date/Publication: 2021-09-10 10:40:06 UTC
* Number of recursive dependencies: 46

Run `revdepcheck::cloud_details(, "edmcr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘edmcr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dpf
    > ### Title: Dissimilarity Parameterization Formulation
    > ### Aliases: dpf
    > 
    > ### ** Examples
    > 
    > set.seed(1337)
    ...
    +              4,1,0,5,NA,5,
    +              3,NA,5,0,1,NA,
    +              4,5,NA,1,0,5,
    +              3,NA,5,NA,5,0),byrow=TRUE, nrow=6)
    > 
    > edmc(D, method="dpf", d=3, toler=1e-8)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: edmc ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# gdistance

<details>

* Version: 1.6.4
* GitHub: https://github.com/AgrDataSci/gdistance
* Source code: https://github.com/cran/gdistance
* Date/Publication: 2023-06-19 21:20:02 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "gdistance")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gdistance-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: accCost
    > ### Title: Accumulated Cost Surface
    > ### Aliases: accCost accCost,TransitionLayer,RasterLayer-method
    > ###   accCost,TransitionLayer,Coords-method
    > ### Keywords: spatial
    > 
    > ### ** Examples
    ...
    > tr <- geoCorrection(tr)
    > 
    > c1 <- c(5.5,1.5)
    > c2 <- c(1.5,5.5)
    > 
    > A <- accCost(tr, c1)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: accCost ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Overview.Rmd’ using knitr
    
    Quitting from lines 262-265 [gdistance-13] (Overview.Rmd)
    Error: processing vignette 'Overview.Rmd' failed with diagnostics:
    'arg' must be of length 1
    --- failed re-building ‘Overview.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Overview.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# gemtc

<details>

* Version: 1.0-2
* GitHub: https://github.com/gertvv/gemtc
* Source code: https://github.com/cran/gemtc
* Date/Publication: 2023-06-21 19:00:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "gemtc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gemtc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: atrialFibrillation
    > ### Title: Prevention of stroke in atrial fibrillation patients
    > ### Aliases: atrialFibrillation
    > 
    > ### ** Examples
    > 
    > # Build a model similar to Model 4(b) from Cooper et al. (2009):
    ...
    +                   classes=classes)
    > 
    > model <- mtc.model(atrialFibrillation,
    +                    type="regression",
    +                    regressor=regressor,
    +                    om.scale=10)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: mtc.model ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test.R’
    Running the tests in ‘tests/test.R’ failed.
    Complete output:
      > library(testthat)
      > test_check('gemtc', filter="unit")
      Loading required package: gemtc
      Loading required package: coda
      [ FAIL 26 | WARN 4 | SKIP 0 | PASS 286 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
        5.         └─gemtc (local) FUN(X[[i]], ...)
        6.           └─gemtc:::local.center(g, edge)
        7.             └─igraph::shortest.paths(graph)
        8.               └─igraph::distances(...)
        9.                 └─igraph:::igraph.match.arg(algorithm)
       10.                   └─base::match.arg(arg = arg, choices = choices, several.ok = several.ok)
      
      [ FAIL 26 | WARN 4 | SKIP 0 | PASS 286 ]
      Error: Test failures
      Execution halted
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
    > # correlations
    > heatmap.2(cor(t(TGFBeta_Smad_data)), scale = "none", trace = "none",
    +           dendrogram = "none", Rowv = FALSE, Colv = FALSE,
    +           col = colorpanel(50, "blue", "white", "red"))
    > # expected correlations (\eqn{\Sigma})
    > sigma_matrix <- make_sigma_mat_dist_graph(TGFBeta_Smad_graph, cor = 0.75)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: make_sigma_mat_dist_graph ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# handwriter

<details>

* Version: 2.0.3
* GitHub: https://github.com/CSAFE-ISU/handwriter
* Source code: https://github.com/cran/handwriter
* Date/Publication: 2023-12-08 20:20:02 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "handwriter")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘handwriter-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: AddLetterImages
    > ### Title: Add Letter Images
    > ### Aliases: AddLetterImages
    > 
    > ### ** Examples
    > 
    > twoSent_document = list()
    > twoSent_document$image = twoSent
    > twoSent_document$thin = thinImage(twoSent_document$image)
    > twoSent_processList = processHandwriting(twoSent_document$thin, dim(twoSent_document$image))
    Starting Processing...
    Getting Nodes...and merging them...
    Finding direct paths...Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: processHandwriting ... shortest.paths -> distances -> igraph.match.arg -> match.arg
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
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
       1. └─handwriter::processHandwriting(actual$thin, dim(actual$image)) at test-processHandwriting.R:29:3
       2.   └─handwriter:::AllUniquePaths(adj.m, skel_graph, skel_graph0)
       3.     └─igraph::shortest.paths(graph0, v = fromNode, to = toNode, weights = E(graph0)$nodeOnlyDist)
       4.       └─igraph::distances(...)
       5.         └─igraph:::igraph.match.arg(algorithm)
       6.           └─base::match.arg(arg = arg, choices = choices, several.ok = several.ok)
      
      [ FAIL 6 | WARN 6 | SKIP 0 | PASS 85 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.0Mb
      sub-directories of 1Mb or more:
        data   1.7Mb
        libs   6.6Mb
    ```

# keyplayer

<details>

* Version: 1.0.4
* GitHub: NA
* Source code: https://github.com/cran/keyplayer
* Date/Publication: 2023-11-08 08:20:06 UTC
* Number of recursive dependencies: 20

Run `revdepcheck::cloud_details(, "keyplayer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘keyplayer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fragment
    > ### Title: Compute the Fragmentation Centrality Score in a Netwrok
    > ### Aliases: fragment
    > 
    > ### ** Examples
    > 
    > # Create a 5x5 weighted and directed adjacency matrix, where edge values
    ...
    > # Transform the edge value to distance interpretaion
    > A <- W
    > A[W!=0] <- 1/W[W!=0]
    > 
    > # List the fragmentation centrality scores for every node
    > fragment(A)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: fragment ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# lconnect

<details>

* Version: 0.1.1
* GitHub: https://github.com/FMestre1/lconnect
* Source code: https://github.com/cran/lconnect
* Date/Publication: 2021-02-06 16:10:02 UTC
* Number of recursive dependencies: 22

Run `revdepcheck::cloud_details(, "lconnect")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lconnect-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: patch_imp
    > ### Title: Prioritization of patches
    > ### Aliases: patch_imp
    > 
    > ### ** Examples
    > 
    > vec_path <- system.file("extdata/vec_projected.shp", package = "lconnect")
    > landscape <- upload_land(vec_path, bound_path = NULL,
    +                         habitat = 1, max_dist = 500)
    > importance <- patch_imp(landscape, metric = "IIC")
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: patch_imp ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# linkprediction

<details>

* Version: 1.0-0
* GitHub: https://github.com/recon-icm/linkprediction
* Source code: https://github.com/cran/linkprediction
* Date/Publication: 2018-10-19 13:40:03 UTC
* Number of recursive dependencies: 43

Run `revdepcheck::cloud_details(, "linkprediction")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(linkprediction)
      > 
      > test_check("linkprediction")
      [ FAIL 1 | WARN 8 | SKIP 0 | PASS 60 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
        6.   ├─base::do.call(method, list(graph = graph, v1 = v1, v2 = v2, ...))
        7.   └─linkprediction:::similarity_dist(...)
        8.     └─igraph::shortest.paths(graph, v = v1, to = v2)
        9.       └─igraph::distances(...)
       10.         └─igraph:::igraph.match.arg(algorithm)
       11.           └─base::match.arg(arg = arg, choices = choices, several.ok = several.ok)
      
      [ FAIL 1 | WARN 8 | SKIP 0 | PASS 60 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# MBNMAdose

<details>

* Version: 0.4.2
* GitHub: NA
* Source code: https://github.com/cran/MBNMAdose
* Date/Publication: 2023-08-08 13:00:19 UTC
* Number of recursive dependencies: 118

Run `revdepcheck::cloud_details(, "MBNMAdose")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MBNMAdose-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: MBNMAdose-package
    > ### Title: MBNMAdose for dose-response Model-Based Network Meta-Analysis
    > ### Aliases: MBNMAdose MBNMAdose-package
    > ### Keywords: internal
    > 
    > ### ** Examples
    > 
    ...
    > network <- mbnma.network(triptans)
    Values for `agent` with dose = 0 have been recoded to `Placebo`
    agent is being recoded to enforce sequential numbering
    > 
    > # Generate a network plot at the dose/treatment level
    > plot(network, level="treatment")
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: plot ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘consistencychecking-3.Rmd’ using rmarkdown
    Warning in eng_r(options) :
      Failed to tidy R code in chunk 'unnamed-chunk-1'. Reason:
    Error : The formatR package is required by the chunk option tidy = TRUE but not installed; tidy = TRUE will be ignored.
    
    
    Quitting from lines 98-102 [unnamed-chunk-1] (consistencychecking-3.Rmd)
    Error: processing vignette 'consistencychecking-3.Rmd' failed with diagnostics:
    'arg' must be of length 1
    ...
    'arg' must be of length 1
    --- failed re-building ‘runmbnmadose-2.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘consistencychecking-3.Rmd’ ‘dataexploration-1.Rmd’
      ‘nma_in_mbnmadose.Rmd’ ‘outputs-4.Rmd’ ‘predictions-5.Rmd’
      ‘runmbnmadose-2.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6 marked Latin-1 strings
    ```

# MBNMAtime

<details>

* Version: 0.2.4
* GitHub: NA
* Source code: https://github.com/cran/MBNMAtime
* Date/Publication: 2023-10-14 15:20:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "MBNMAtime")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MBNMAtime-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: inconsistency.loops
    > ### Title: Identify comparisons in loops that fulfil criteria for
    > ###   node-splitting
    > ### Aliases: inconsistency.loops
    > 
    > ### ** Examples
    > 
    ...
    > data <- data.frame(studyID=c(1,1,2,2,3,3,4,4,5,5,5),
    +   treatment=c(1,2,1,3,2,3,3,4,1,2,4)
    +   )
    > 
    > # Identify comparisons informed by direct and indirect evidence
    > inconsistency.loops(data)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: inconsistency.loops ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘consistencychecking-3.Rmd’ using rmarkdown
    
    Quitting from lines 41-45 [unnamed-chunk-1] (consistencychecking-3.Rmd)
    Error: processing vignette 'consistencychecking-3.Rmd' failed with diagnostics:
    'arg' must be of length 1
    --- failed re-building ‘consistencychecking-3.Rmd’
    
    --- re-building ‘dataexploration-1.Rmd’ using rmarkdown
    
    ...
    
    --- re-building ‘runmbnmatime-2.Rmd’ using rmarkdown
    --- finished re-building ‘runmbnmatime-2.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘consistencychecking-3.Rmd’ ‘dataexploration-1.Rmd’
      ‘predictions-5.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# MEGENA

<details>

* Version: 1.3.7
* GitHub: https://github.com/songw01/MEGENA
* Source code: https://github.com/cran/MEGENA
* Date/Publication: 2018-09-10 19:00:03 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "MEGENA")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MEGENA_pipeline_10062016.Rmd’ using rmarkdown
    
    Quitting from lines 77-93 [MCA] (MEGENA_pipeline_10062016.Rmd)
    Error: processing vignette 'MEGENA_pipeline_10062016.Rmd' failed with diagnostics:
    'arg' must be of length 1
    --- failed re-building ‘MEGENA_pipeline_10062016.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘MEGENA_pipeline_10062016.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        data   1.8Mb
        libs   3.1Mb
    ```

# modnets

<details>

* Version: 0.9.0
* GitHub: https://github.com/tswanson222/modnets
* Source code: https://github.com/cran/modnets
* Date/Publication: 2021-10-01 08:20:02 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "modnets")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘modnets-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CentClust
    > ### Title: Node centrality, clustering coefficients, and shortest path
    > ###   lengths
    > ### Aliases: CentClust centAuto clustAuto
    > 
    > ### ** Examples
    > 
    ...
    V1         0.01433650           1
    V2        -0.01038401           1
    V3        -0.01317170           1
    V4         0.05605313           1
    V5         0.01671756           1
    > centAuto(x, 'interactions')
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: centAuto ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        data   3.8Mb
    ```

# MTA

<details>

* Version: 0.6.0
* GitHub: https://github.com/riatelab/MTA
* Source code: https://github.com/cran/MTA
* Date/Publication: 2023-10-31 10:40:02 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "MTA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MTA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: map_mst
    > ### Title: Map Multiscalar Typology (3 deviations)
    > ### Aliases: map_mst
    > 
    > ### ** Examples
    > 
    > # Load data
    ...
    > ept <- st_read(system.file("metroparis.gpkg", package = "MTA"), layer = "ept", quiet = TRUE)
    > 
    > # Prerequisites - Compute the 3 deviations
    > com$gdev <- gdev(x = com, var1 = "INC", var2 = "TH")
    > com$tdev <- tdev(x = com, var1 = "INC", var2 = "TH", key = "EPT")
    > com$sdev <- sdev(x = com, var1 = "INC", var2 = "TH", order = 1)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: sdev ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MTA.Rmd’ using rmarkdown
    --- finished re-building ‘MTA.Rmd’
    
    --- re-building ‘MTA_Scenario.Rmd’ using rmarkdown
    
    Quitting from lines 439-473 [localdevrel_plot] (MTA_Scenario.Rmd)
    Error: processing vignette 'MTA_Scenario.Rmd' failed with diagnostics:
    'arg' must be of length 1
    --- failed re-building ‘MTA_Scenario.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘MTA_Scenario.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# nat.templatebrains

<details>

* Version: 1.1
* GitHub: https://github.com/natverse/nat.templatebrains
* Source code: https://github.com/cran/nat.templatebrains
* Date/Publication: 2023-06-14 08:20:05 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "nat.templatebrains")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(nat.templatebrains)
      Loading required package: nat
      Loading required package: rgl
      Some nat functions depend on a CMTK installation. See ?cmtk and README.md for details.
      
    ...
        5.   └─nat.templatebrains::shortest_bridging_seq(...)
        6.     └─nat.templatebrains:::find_bridging_path(...)
        7.       └─igraph::shortest.paths(g, v = sample, to = reference, mode = "out")
        8.         └─igraph::distances(...)
        9.           └─igraph:::igraph.match.arg(algorithm)
       10.             └─base::match.arg(arg = arg, choices = choices, several.ok = several.ok)
      
      [ FAIL 1 | WARN 2 | SKIP 3 | PASS 61 ]
      Error: Test failures
      Execution halted
    ```

# NetSci

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/NetSci
* Date/Publication: 2022-07-03 18:00:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "NetSci")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetSci-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: proximity_average_weighted
    > ### Title: Proximity from target to source
    > ### Aliases: proximity_average_weighted
    > 
    > ### ** Examples
    > 
    > set.seed(666)
    ...
    > net = unique(net)
    > net$weight = runif(nrow(net))
    > g <- igraph::graph_from_data_frame(net, directed = FALSE )
    > T = c("G", "A", "D")
    > S = c("C", "M")
    > proximity_average_weighted(g, source = S, targets = T)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: proximity_average_weighted ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# NetworkComparr

<details>

* Version: 0.0.0.9
* GitHub: NA
* Source code: https://github.com/cran/NetworkComparr
* Date/Publication: 2023-08-11 08:30:02 UTC
* Number of recursive dependencies: 161

Run `revdepcheck::cloud_details(, "NetworkComparr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetworkComparr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CompareEdgelistNetworks
    > ### Title: Statistical Comparison of Networks based on Edgelists
    > ### Aliases: CompareEdgelistNetworks CEN
    > 
    > ### ** Examples
    > 
    > ###Simulate datasets with a dependent sample and directed networks
    ...
    +             test.edges=TRUE, edge=list(c(1,3),c(4,2),c(3,2)), p.adjust.methods= "none",
    +             test.centrality=TRUE, centrality=c("Closeness", "Betweenness"), cen.nodes="all",
    +             test.bridge.centrality=FALSE, bridge.centrality="all", brg.nodes=c(1,3),
    +             communities=c("1","1","2","2"), useCommunities="all")
    
      |                                                                            
      |                                                                      |   0%Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: CEN ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# Patterns

<details>

* Version: 1.4
* GitHub: https://github.com/fbertran/Patterns
* Source code: https://github.com/cran/Patterns
* Date/Publication: 2022-12-01 13:10:05 UTC
* Number of recursive dependencies: 188

Run `revdepcheck::cloud_details(, "Patterns")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Patterns-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: analyze_network,omics_network-method
    > ### Title: Analysing the network
    > ### Aliases: analyze_network,omics_network-method analyze_network
    > ###   analyze_network-methods
    > ### Keywords: methods
    > 
    > ### ** Examples
    ...
    
        union
    
    Loading required package: survival
    tnet: Analysis of Weighted, Two-mode, and Longitudinal networks.
    Type ?tnet for help.
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: analyze_network ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# qgraph

<details>

* Version: 1.9.8
* GitHub: https://github.com/SachaEpskamp/qgraph
* Source code: https://github.com/cran/qgraph
* Date/Publication: 2023-11-03 11:00:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "qgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘qgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: centrality
    > ### Title: Centrality statistics of graphs
    > ### Aliases: centrality
    > ### Keywords: graphs
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    > adj <- matrix(sample(0:1,10^2,TRUE,prob=c(0.8,0.2)),nrow=10,ncol=10)
    > Q <- qgraph(adj)
    > 
    > centrality(Q)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: centrality ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

# rags2ridges

<details>

* Version: 2.2.7
* GitHub: https://github.com/CFWP/rags2ridges
* Source code: https://github.com/cran/rags2ridges
* Date/Publication: 2023-10-14 14:10:02 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "rags2ridges")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rags2ridges-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GGMpathStats
    > ### Title: Gaussian graphical model node pair path statistics
    > ### Aliases: GGMpathStats
    > 
    > ### ** Examples
    > 
    > 
    ...
    - Retained elements:  11 
    - Corresponding to 3.67 % of possible edges 
     
    > 
    > ## Obtain information on mediating and moderating paths between nodes 14 and 23
    > pathStats <- GGMpathStats(PC0, 14, 23, verbose = TRUE, prune = FALSE)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: GGMpathStats ... shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.4Mb
      sub-directories of 1Mb or more:
        libs   8.6Mb
    ```

# ResIN

<details>

* Version: 1.1.0
* GitHub: https://github.com/pwarncke77/ResIN
* Source code: https://github.com/cran/ResIN
* Date/Publication: 2023-06-30 10:10:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "ResIN")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ResIN-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ResIN
    > ### Title: ResIN
    > ### Aliases: ResIN
    > 
    > ### ** Examples
    > 
    > 
    ...
    > ## Load the 12-item simulated Likert-type ResIN toy dataset
    > data(lik_data)
    > library(ggplot2)
    > 
    > # Apply the ResIN function to toy Likert data:
    > output <- ResIN(lik_data, cor_method = "spearman", network_stats = TRUE, cluster = TRUE)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: ResIN ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ResIN-VIGNETTE.Rmd’ using rmarkdown
    
    Quitting from lines 42-46 [run ResIN] (ResIN-VIGNETTE.Rmd)
    Error: processing vignette 'ResIN-VIGNETTE.Rmd' failed with diagnostics:
    'arg' must be of length 1
    --- failed re-building ‘ResIN-VIGNETTE.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ResIN-VIGNETTE.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# secrlinear

<details>

* Version: 1.2.2
* GitHub: https://github.com/MurrayEfford/secrlinear
* Source code: https://github.com/cran/secrlinear
* Date/Publication: 2023-10-17 04:20:02 UTC
* Number of recursive dependencies: 84

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
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: networkdistance ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > 
      > # to run manually
      > # test_dir("/Density secr 4.5/secrlinear/tests")
      > 
      > test_check("secrlinear")
      Loading required package: secrlinear
    ...
       1. └─secrlinear::networkdistance(trps, mask, mask) at test-secrlinear.R:34:5
       2.   ├─base::t(...)
       3.   └─igraph::shortest.paths(gr, weights = NULL, v = matchedxy2, to = uniquematchedxy1)
       4.     └─igraph::distances(...)
       5.       └─igraph:::igraph.match.arg(algorithm)
       6.         └─base::match.arg(arg = arg, choices = choices, several.ok = several.ok)
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 6 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘secrlinear-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 91-100 [fit1] (secrlinear-vignette.Rmd)
    Error: processing vignette 'secrlinear-vignette.Rmd' failed with diagnostics:
    'arg' must be of length 1
    --- failed re-building ‘secrlinear-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘secrlinear-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# spatialreg

<details>

* Version: 1.3-2
* GitHub: https://github.com/r-spatial/spatialreg
* Source code: https://github.com/cran/spatialreg
* Date/Publication: 2024-02-06 13:30:02 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "spatialreg")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘SpatialFiltering.Rmd’ using rmarkdown
    --- finished re-building ‘SpatialFiltering.Rmd’
    
    --- re-building ‘nb_igraph.Rmd’ using rmarkdown
    
    Quitting from lines 286-291 [unnamed-chunk-26] (nb_igraph.Rmd)
    Error: processing vignette 'nb_igraph.Rmd' failed with diagnostics:
    'arg' must be of length 1
    ...
    --- failed re-building ‘nb_igraph.Rmd’
    
    --- re-building ‘sids_models.Rmd’ using rmarkdown
    --- finished re-building ‘sids_models.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘nb_igraph.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# spdep

<details>

* Version: 1.3-3
* GitHub: https://github.com/r-spatial/spdep
* Source code: https://github.com/cran/spdep
* Date/Publication: 2024-02-07 12:20:02 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "spdep")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spdep-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: nblag
    > ### Title: Higher order neighbours lists
    > ### Aliases: nblag nblag_cumul
    > ### Keywords: spatial
    > 
    > ### ** Examples
    > 
    ...
    + for (i in seq(along=lmat)) mat = mat + i*lmat[[i]]
    + G2 <- shortest.paths(G)
    + print(all.equal(G2, mat, check.attributes=FALSE))
    + }
    Warning: `shortest.paths()` was deprecated in igraph 2.0.0.
    ℹ Please use `distances()` instead.
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: shortest.paths -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.6Mb
      sub-directories of 1Mb or more:
        doc   5.3Mb
        etc   1.4Mb
    ```

# SubpathwayLNCE

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/SubpathwayLNCE
* Date/Publication: 2016-01-19 08:17:59
* Number of recursive dependencies: 16

Run `revdepcheck::cloud_details(, "SubpathwayLNCE")` for more info

</details>

## Newly broken

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘SubpathwayLNCE.Rnw’
      ...
    > interUMGraph <- getInteGraphList(g2[42:45], LncGenePairs)
    
    > geneLnc <- GetExampleData(exampleData = "geneLnc")
    
    > sub <- getLocSubGraphLnc(geneLnc, interUMGraph, type = "gene_lncRNA", 
    +     n = 1, s = 8)
    
      When sourcing ‘SubpathwayLNCE.R’:
    Error: 'arg' must be of length 1
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
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    
    --- failed re-building ‘SubpathwayLNCE.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘SubpathwayLNCE.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tnet

<details>

* Version: 3.0.16
* GitHub: NA
* Source code: https://github.com/cran/tnet
* Date/Publication: 2020-02-24 18:00:02 UTC
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "tnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: closeness_w
    > ### Title: Closeness centrality in a weighted network
    > ### Aliases: closeness_w
    > 
    > ### ** Examples
    > 
    > ## Load sample data
    ...
    + c(5,2,2),
    + c(5,6,1),
    + c(6,5,1))
    > 
    > ## Run the programme
    > closeness_w(sampledata)
    Error in match.arg(arg = arg, choices = choices, several.ok = several.ok) : 
      'arg' must be of length 1
    Calls: closeness_w ... <Anonymous> -> distances -> igraph.match.arg -> match.arg
    Execution halted
    ```

