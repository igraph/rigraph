# Boptbd (1.0.7)

* Email: <mailto:diboobayu@gmail.com>
* GitHub mirror: <https://github.com/cran/Boptbd>

Run `revdepcheck::cloud_details(, "Boptbd")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### Title: Creates the graphical layout of resultant optimal design
     > ### Aliases: graphoptBbd
     > ### Keywords: Graphical layout
     > 
     > ### ** Examples
     > 
     >     ##To create the graphical layout of the D-optimal block design
     >     ##obtained using the treatment exchange algorithm for 
     >     trt.N <- 10  #Number of treatments
     >     blk.N <- 10  #Number of blocks
     >     alpha <- 0.1 #alpha value 
     >     beta  <- 0.1 #beta value 
     >     OptdesF <- rbind(1:10, c(2:10,1)) #Bayesian A-optimal block design (loop design)
     > 
     >     graphoptBbd(trt.N = 10, blk.N = 10, alpha = 0.1, beta = 0.1, OptdesF, Optcrit = "A")
     Error:
     ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─Boptbd::graphoptBbd(...)
      2.   └─igraph::tkplot(...)
      3.     └─lifecycle::deprecate_stop("3.0.0", "tkplot()")
      4.       └─lifecycle:::deprecate_stop0(msg)
      5.         └─rlang::cnd_signal(...)
     Execution halted
     ```
