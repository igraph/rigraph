# EDOIF (0.1.4)

* GitHub: <https://github.com/DarkEyes/EDOIF>
* Email: <mailto:grandca@gmail.com>
* GitHub mirror: <https://github.com/cran/EDOIF>

Run `revdepcheck::revdep_details(, "EDOIF")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > # Generate simulation data
     > nInv<-100
     > initMean=10
     > stepMean=20
     > std=8
     > simData1<-c()
     > simData1$Values<-rnorm(nInv,mean=initMean,sd=std)
     > simData1$Group<-rep(c("C1"),times=nInv)
     > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean,sd=std) )
     > simData1$Group<-c(simData1$Group,rep(c("C2"),times=nInv))
     > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+2*stepMean,sd=std) )
     > simData1$Group<-c(simData1$Group,rep(c("C3"),times=nInv) )
     > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+3*stepMean,sd=std) )
     > simData1$Group<-c(simData1$Group, rep(c("C4"),times=nInv) )
     > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+4*stepMean,sd=std) )
     > simData1$Group<-c(simData1$Group, rep(c("C5"),times=nInv) )
     > 
     > # Performing ordering infernce from simData1
     > 
     > resultObj<-EDOIF(simData1$Values,simData1$Group)
     Error in graph_from_adjacency_matrix(adjMat) %>% set_vertex_attr("label",  : 
       could not find function "%>%"
     Calls: EDOIF -> getiGraphOBJ
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘EDOIF_demo.Rmd’ using knitr
     
     Quitting from EDOIF_demo.Rmd:33-45 [unnamed-chunk-1]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `graph_from_adjacency_matrix(adjMat) %>% set_vertex_attr("label", value = sortedGroupList)`:
     ! could not find function "%>%"
     ---
     Backtrace:
         ▆
      1. └─EDOIF::EDOIF(Values, Group, bootT = bootT, alpha = alpha)
      2.   └─EDOIF::getiGraphOBJ(out5$adjMat, out1$sortedGroupList)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'EDOIF_demo.Rmd' failed with diagnostics:
     could not find function "%>%"
     --- failed re-building ‘EDOIF_demo.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘EDOIF_demo.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     getiGraphOBJ: no visible global function definition for ‘%>%’
     plotGraph: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

