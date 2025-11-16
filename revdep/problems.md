# Cascade

<details>

* Version: 2.3
* GitHub: https://github.com/fbertran/Cascade
* Source code: https://github.com/cran/Cascade
* Date/Publication: 2025-09-19 07:00:23 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "Cascade")` for more info

</details>

## Newly broken

*   checking whether package ‘Cascade’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘igraph::circulant’ by ‘magic::circulant’ when loading ‘Cascade’
    See ‘/tmp/workdir/Cascade/new/Cascade.Rcheck/00install.out’ for details.
    ```

# jewel

<details>

* Version: 2.0.2
* GitHub: https://github.com/annaplaksienko/jewel
* Source code: https://github.com/cran/jewel
* Date/Publication: 2024-05-22 21:20:07 UTC
* Number of recursive dependencies: 42

Run `revdepcheck::cloud_details(, "jewel")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jewel-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: constructWeights
    > ### Title: Construct weights for _jewel_ minimization problem from prior
    > ###   information on vertices degrees.
    > ### Aliases: constructWeights
    > 
    > ### ** Examples
    > 
    > {
    + K <- 3
    + p <- 50
    + n <- 20
    + data <- generateData_rewire(K = K, p = p, n = n, ncores = 1, verbose = FALSE)
    + G_list_true <- data$Graphs
    + true_degrees <- rowSums(G_list_true[[1]])
    + cut <- sort(true_degrees, decreasing = TRUE)[ceiling(p * 0.03)]
    + apriori_hubs <- ifelse(true_degrees >= cut, 10, 1)
    + W <- constructWeights(apriori_hubs, K = K)
    + }
    Error in rewire_impl(rewire = graph, n = niter, mode = mode) : 
      At rinterface_extra.c:83 : The value 2.4500000000000002 is not representable as an integer. Invalid value
    Calls: generateData_rewire ... do_call -> eval -> eval -> <Anonymous> -> rewire_impl
    Execution halted
    ```

# RPANDA

<details>

* Version: 2.5
* GitHub: https://github.com/hmorlon/PANDA
* Source code: https://github.com/cran/RPANDA
* Date/Publication: 2025-09-24 10:50:07 UTC
* Number of recursive dependencies: 134

Run `revdepcheck::cloud_details(, "RPANDA")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        R      3.5Mb
        data   1.6Mb
    ```

# rSpectral

<details>

* Version: 1.0.0.10
* GitHub: https://github.com/cmclean5/rSpectral
* Source code: https://github.com/cran/rSpectral
* Date/Publication: 2023-01-18 12:00:02 UTC
* Number of recursive dependencies: 39

Run `revdepcheck::cloud_details(, "rSpectral")` for more info

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
      > library(rSpectral)
      > 
      > test_check("rSpectral")
      Loading required package: BiocGenerics
      
      Attaching package: 'BiocGenerics'
      
      The following objects are masked from 'package:stats':
      
          IQR, mad, sd, var, xtabs
      
      The following objects are masked from 'package:base':
      
          Filter, Find, Map, Position, Reduce, anyDuplicated, aperm, append,
          as.data.frame, basename, cbind, colnames, dirname, do.call,
          duplicated, eval, evalq, get, grep, grepl, intersect, is.unsorted,
          lapply, mapply, match, mget, order, paste, pmax, pmax.int, pmin,
          pmin.int, rank, rbind, rownames, sapply, saveRDS, setdiff, table,
          tapply, union, unique, unsplit, which.max, which.min
      
      This graph was created by an old(er) igraph version.
      i Call `igraph::upgrade_graph()` on it to use with the current igraph version.
      For now we convert it on the fly...
      [ FAIL 2 | WARN 4 | SKIP 0 | PASS 10 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-igraph.R:19:3'): membership fix_neig=0 is correct ────────────
      c$modularity (`actual`) not equal to `exp_mod10` (`expected`).
      
        `actual`: 0.432
      `expected`: 0.408
      ── Failure ('test-igraph.R:26:3'): membership fix_neig=1 is correct ────────────
      c$modularity (`actual`) not equal to `exp_mod11` (`expected`).
      
        `actual`: 0.3758
      `expected`: 0.3776
      
      [ FAIL 2 | WARN 4 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

