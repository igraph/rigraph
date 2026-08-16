# bnstruct (1.0.15)

* Email: <mailto:afranzin@ulb.ac.be>
* GitHub mirror: <https://github.com/cran/bnstruct>

Run `revdepcheck::revdep_details(, "bnstruct")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       
       The following object is masked from 'package:base':
       
           union
       
       Saving _problems/test_em-8.R
       [ FAIL 1 | WARN 5 | SKIP 1 | PASS 1 ]
       
       ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
       • On CRAN (1): 'test_em_contdata.R:3:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_em.R:8:1'): (code run outside of `test_that()`) ────────────────
       Error in `if (!is.na(clique) && !is.na(parents.list[clique])) {     out <- compute.message(potentials[[process.order[clique]]], dimensions.contained[[process.order[clique]]], cliques[[process.order[clique]]], cliques[[parents.list[clique]]], node.sizes)     msg.pots[[process.order[clique]]] <- out$potential     msg.vars[[process.order[clique]]] <- out$vars     bk <- potentials[[parents.list[clique]]]     bkd <- dimensions.contained[[parents.list[clique]]]     out <- mult(potentials[[parents.list[clique]]], dimensions.contained[[parents.list[clique]]], msg.pots[[process.order[clique]]], msg.vars[[process.order[clique]]], node.sizes)     potentials[[parents.list[clique]]] <- out$potential     dimensions.contained[[parents.list[clique]]] <- out$vars }`: missing value where TRUE/FALSE needed
       Backtrace:
           ▆
        1. ├─bnstruct::em(inf.engine, dataset) at test_em.R:8:1
        2. └─bnstruct::em(inf.engine, dataset)
        3.   ├─bnstruct::belief.propagation(eng)
        4.   └─bnstruct::belief.propagation(eng)
       
       [ FAIL 1 | WARN 5 | SKIP 1 | PASS 1 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘bnstruct.Rnw’ using Sweave
     Error: processing vignette 'bnstruct.Rnw' failed with diagnostics:
     Running 'texi2dvi' on 'bnstruct.tex' failed.
     LaTeX errors:
     ! LaTeX Error: File `pdfpages.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.6 ^^M
            
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘bnstruct.Rnw’
     
     SUMMARY: processing the following file failed:
       ‘bnstruct.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

