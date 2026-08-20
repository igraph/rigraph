# cloneRate (0.2.3)

* GitHub: <https://github.com/bdj34/cloneRate>
* Email: <mailto:brian.d.johnson97@gmail.com>
* GitHub mirror: <https://github.com/cran/cloneRate>

Run `revdepcheck::revdep_details(, "cloneRate")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Chain 4: Iteration: 1800 / 2000 [ 90%]  (Sampling)
       Chain 4: Iteration: 2000 / 2000 [100%]  (Sampling)
       Chain 4: 
       Chain 4:  Elapsed Time: 1.181 seconds (Warm-up)
       Chain 4:                1.102 seconds (Sampling)
       Chain 4:                2.283 seconds (Total)
       Chain 4: 
       You have set includeStem = TRUE. Note that we do not include the stem
                   as part of the site frequency calculation in our work (Johnson et
                   al. 2022), due to the fact that we don't know when clone initiation
                   actually occurs.
       [ FAIL 1 | WARN 6 | SKIP 0 | PASS 81 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-growthRateMethods.R:94:3'): MCMC gices expected output ───────
       Expected `mcmcOut$estimate < 2` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 1 | WARN 6 | SKIP 0 | PASS 81 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

