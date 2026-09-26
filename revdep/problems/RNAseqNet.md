# RNAseqNet (0.1.5)

* Email: <mailto:nathalie.vialaneix@inrae.fr>
* GitHub mirror: <https://github.com/cran/RNAseqNet>

Run `revdepcheck::revdep_details(, "RNAseqNet")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘RNAseqNet-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: GLMnetwork
     > ### Title: Infer a network from RNA-seq expression.
     > ### Aliases: GLMnetwork
     > 
     > ### ** Examples
     > 
     > data(lung)
     > lambdas <- 4 * 10^(seq(0, -2, length = 10))
     > ref_lung <- GLMnetwork(lung, lambdas = lambdas)
     Error in lapply(all_glms, function(alist) alist[, indl]) %>% unlist() : 
       could not find function "%>%"
     Calls: GLMnetwork -> lapply -> FUN
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     GLMnetwork : <anonymous>: no visible global function definition for
       ‘%>%’
     chooseSigma: no visible global function definition for ‘%>%’
     imputedGLMnetwork: no visible global function definition for ‘%>%’
     stabilitySelection: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

