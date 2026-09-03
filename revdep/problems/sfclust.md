# sfclust (1.1.0)

* GitHub: <https://github.com/ErickChacon/sfclust>
* Email: <mailto:erick.chaconmontalvan@wur.nl>
* GitHub mirror: <https://github.com/cran/sfclust>

Run `revdepcheck::revdep_details(, "sfclust")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       `expected@x`: 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00            ...
       
       ── Failure ('test-generate-clusters.R:158:3'): genclust: stars with raster ─────
       Expected `as_adjacency_matrix(clust$mst)` to equal `as(A, "generalMatrix")`.
       Differences:
         `actual@x`: 0.77 0.77 0.07 0.07 0.13 0.76 0.54 0.40 0.54 0.44 and 12 more...
       `expected@x`: 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00            ...
       
       ── Failure ('test-generate-clusters.R:180:3'): genclust: stars with raster and NA cells ──
       Expected `as_adjacency_matrix(clust$graph)` to equal `as(A, "generalMatrix")`.
       Differences:
         `actual@x`: 0.46 0.17 0.31 0.46 0.17 0.15 0.35 0.31 0.35 0.19 and 20 more...
       `expected@x`: 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00            ...
       
       ── Failure ('test-generate-clusters.R:186:3'): genclust: stars with raster and NA cells ──
       Expected `as_adjacency_matrix(clust$mst)` to equal `as(A, "generalMatrix")`.
       Differences:
         `actual@x`: 0.46 0.17 0.46 0.17 0.15 0.35 0.35 0.19 0.00 0.15 and 12 more...
       `expected@x`: 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00            ...
       
       
       [ FAIL 11 | WARN 0 | SKIP 8 | PASS 119 ]
       Error:
       ! Test failures.
       Execution halted
     ```

