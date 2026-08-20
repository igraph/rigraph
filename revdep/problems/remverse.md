# remverse (0.2.0)

* GitHub: <https://github.com/TilburgNetworkGroup/remverse>
* Email: <mailto:j.mulder3@tilburguniversity.edu>
* GitHub mirror: <https://github.com/cran/remverse>

Run `revdepcheck::revdep_details(, "remverse")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      1. └─remstimate::remixture(...)
      2.   └─remstimate::remstimate(...)
      3.     ├─base::do.call(...)
      4.     └─remstimate (local) `<fn>`(...)
      5.       └─base::lapply(...)
      6.         └─remstimate (local) FUN(X[[i]], ...)
      7.           └─remstimate:::.mixrem_fit_one(...)
      8.             └─base::`colnames<-`(`*tmp*`, value = paste0("Component.", seq_len(k)))
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'rem-mixrem.Rmd' failed with diagnostics:
     length of 'dimnames' [2] not equal to array extent
     --- failed re-building ‘rem-mixrem.Rmd’
     
     --- re-building ‘rem-pipeline.Rmd’ using rmarkdown
     --- finished re-building ‘rem-pipeline.Rmd’
     
     --- re-building ‘rem-window.Rmd’ using rmarkdown
     --- finished re-building ‘rem-window.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘rem-mixrem.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

