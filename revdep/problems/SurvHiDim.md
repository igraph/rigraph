# SurvHiDim (0.1.1)

* Email: <mailto:atanustat@gmail.com>
* GitHub mirror: <https://github.com/cran/SurvHiDim>

Run `revdepcheck::revdep_details(, "SurvHiDim")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘SurvHiDim-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: hidimSurvlas
     > ### Title: hidimSurvlas Two step filteration without bonferroni correction
     > ### Aliases: hidimSurvlas
     > 
     > ### ** Examples
     > 
     > ##
     > data(hnscc)
     > hidimSurvlas(7,105,0.05,ID="id",OS="os",Death="death",PFS="pfs",Prog="prog",hnscc)
     Error in commondata2 %>% data.matrix() : could not find function "%>%"
     Calls: hidimSurvlas
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     hidimSurvbonlas: no visible global function definition for ‘%>%’
     hidimSurvlas: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘readr’
       All declared Imports should be used.
     ```

