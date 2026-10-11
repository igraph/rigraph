# rSDI (0.2.2)

* GitHub: <https://github.com/ehengirmen/rSDI>
* Email: <mailto:mehmetgencer@yahoo.com>
* GitHub mirror: <https://github.com/cran/rSDI>

Run `revdepcheck::revdep_details(, "rSDI")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘rSDI.Rmd’ using rmarkdown
     
     Quitting from rSDI.Rmd:186-194 [multi.metric.example]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `toyGraph %>% SDI(variant = "nuw") %>% SDI(variant = "niu") %>% SDI(variant = "vuw") %>%
         SDI(variant = "vuu")`:
     ! could not find function "%>%"
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'rSDI.Rmd' failed with diagnostics:
     could not find function "%>%"
     --- failed re-building ‘rSDI.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘rSDI.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

