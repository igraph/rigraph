# degreenet (1.3-7)

* Email: <mailto:handcock@stat.ucla.edu>
* GitHub mirror: <https://github.com/cran/degreenet>

Run `revdepcheck::revdep_details(, "degreenet")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘degreenet-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: reedmolloy
     > ### Title: Generate a undirected network with a given sequence of degrees
     > ### Aliases: reedmolloy
     > ### Keywords: models
     > 
     > ### ** Examples
     > 
     > # Now, simulate a Poisson Lognormal distribution over 100
     > # observations with mean = -1 and s.d. = 1.
     > 
     > set.seed(2)
     > s4 <- simpln(n=100, v=c(-1,1))
     > table(s4)
     s4
      1  2  3  4  5  6 
     65 18  7  4  4  2 
     > #
     > simr <- reedmolloy(s4)
     Error in reedmolloy(s4) : 
       The reedmolloy function failed to form a valid network from the passed degree sequence.
     Execution halted
     ```

