# grainscape

<details>

* Version: 0.4.4
* GitHub: https://github.com/achubaty/grainscape
* Source code: https://github.com/cran/grainscape
* Date/Publication: 2023-04-20 08:40:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "grainscape")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > test_check("grainscape")
      Loading required package: grainscape
      Writing layer `nodes' to data source 
        `/tmp/RtmpXa81Of/tiny_goc_thresh2' using driver `ESRI Shapefile'
      Writing 28 features with 5 fields and geometry type Point.
      Writing layer `linksCentroid' to data source 
        `/tmp/RtmpXa81Of/tiny_goc_thresh2' using driver `ESRI Shapefile'
      Writing 59 features with 15 fields and geometry type Line String.
      Writing layer `nodes' to data source 
        `/tmp/RtmpXa81Of/tiny_mpg' using driver `ESRI Shapefile'
      Writing 43 features with 4 fields and geometry type Point.
      Writing layer `linksCentroid' to data source 
        `/tmp/RtmpXa81Of/tiny_mpg' using driver `ESRI Shapefile'
      Writing 93 features with 12 fields and geometry type Line String.
      Writing layer `linksPerim' to data source 
        `/tmp/RtmpXa81Of/tiny_mpg' using driver `ESRI Shapefile'
      Writing 93 features with 8 fields and geometry type Line String.
      IGRAPH 3753ef2 UN-- 43 89 -- 
      + attr: name (v/c), patchId (v/n), patchArea (v/n), patchEdgeArea
      | (v/n), coreArea (v/n), centroidX (v/n), centroidY (v/n), linkId
      | (e/n), lcpPerimWeight (e/n), startPerimX (e/n), startPerimY (e/n),
      | endPerimX (e/n), endPerimY (e/n)
      + edges from 3753ef2 (vertex names):
       [1] 62 --74  30 --41  30 --40  7  --22  5  --7   80 --86  73 --78  29 --31 
       [9] 19 --29  67 --85  41 --48  40 --41  37 --41  8  --28  9  --12  12 --14 
      [17] 30 --48  8  --9   48 --54  95 --103 62 --64  5  --22  32 --37  74 --84 
      [25] 55 --56  5  --32  9  --28  68 --80  14 --19  30 --54  5  --37  54 --55 
      [33] 64 --74  86 --100 100--107 41 --50  56 --76  56 --61  103--105 9  --14 
      + ... omitted several edges
      [ FAIL 1 | WARN 2 | SKIP 0 | PASS 81 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-corridor-distance-point.R:31:3'): corridor handles NA values ───
      Error in `shortest_paths(x@th[[whichThresh]]$goc, which(V(x@th[[whichThresh]]$goc)$polygonId == 
          na.omit(startEndPolygons[1])), which(V(x@th[[whichThresh]]$goc)$polygonId == 
          na.omit(startEndPolygons[2])), weights = V(x@th[[whichThresh]]$goc)$meanWeight)`: At rinterface_extra.c:138 : Wrong index. Attempt to get element with index 0 from vector of length 0. Invalid value
      Backtrace:
          ▆
       1. ├─testthat::expect_warning(...) at test-corridor-distance-point.R:31:3
       2. │ └─testthat:::quasi_capture(...)
       3. │   ├─testthat (local) .capture(...)
       4. │   │ └─base::withCallingHandlers(...)
       5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       6. ├─grainscape::corridor(goc, whichThresh = 2, coordSomeNA)
       7. └─grainscape::corridor(goc, whichThresh = 2, coordSomeNA)
       8.   └─grainscape (local) .local(x, ...)
       9.     └─igraph::shortest_paths(...)
      
      [ FAIL 1 | WARN 2 | SKIP 0 | PASS 81 ]
      Error: Test failures
      Execution halted
    ```

# multilaterals

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/multilaterals
* Date/Publication: 2017-09-07 15:23:58 UTC
* Number of recursive dependencies: 15

Run `revdepcheck::cloud_details(, "multilaterals")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multilaterals-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: multilaterals
    > ### Title: Transitive Index Numbers for Cross-Sections and Panel Data
    > ### Aliases: multilaterals-package multilaterals
    > ### Keywords: package
    > 
    > ### ** Examples
    > 
    > 
    > data('multil_data')
    > 
    > ## From 'An introduction to Efficiency and
    > ##  Productivity Analysis' (Coelli et al., 2005), page 124-126.
    > inputIndx = multilateral(data.x=billy_inp_q,data.y=billy_inp_p,var.agg='year',
    +  idx='fisher',PAR=FALSE,transitivity='eks',bench=2000,period=NULL )
    > outputIndx = multilateral(data.x=billy_out_q,data.y=billy_out_p, var.agg='year',
    +  PAR=FALSE,transitivity='mst',bench=2000,period=NULL )
    Error in igraph::shortest_paths(ig, from = startNode, to = endNode) : 
      At rinterface_extra.c:138 : Wrong index. Attempt to get element with index 0 from vector of length 0. Invalid value
    Calls: multilateral -> multicomp -> <Anonymous>
    Execution halted
    ```

