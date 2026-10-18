# power_law_fit_impl basic

    Code
      power_law_fit_impl(data = c(1, 2, 3))
    Output
      $continuous
      [1] FALSE
      
      $alpha
      [1] 1.646771
      
      $xmin
      [1] 1
      
      $logLik
      [1] -5.272517
      
      $KS.stat
      [1] 0.2640998
      

---

    Code
      power_law_fit_impl(data = c(1, 2, 3), xmin = 1, force_continuous = TRUE)
    Output
      $continuous
      [1] TRUE
      
      $alpha
      [1] 2.116221
      
      $xmin
      [1] 1
      
      $logLik
      [1] -3.461912
      
      $KS.stat
      [1] 0.3533555
      

# power_law_fit_impl errors

    Code
      power_law_fit_impl(data = "a")
    Condition
      Warning in `power_law_fit_impl()`:
      NAs introduced by coercion
      Error in `power_law_fit_impl()`:
      ! xmin must be greater than zero. Invalid value
      Source: <file>:<line>

# solve_lsap_impl basic

    Code
      solve_lsap_impl(c = matrix(1:4, ncol = 2), n = 2)
    Output
      [1] 0 1

# solve_lsap_impl errors

    Code
      solve_lsap_impl(c = "a", n = 2)
    Condition
      Warning in `solve_lsap_impl()`:
      NAs introduced by coercion
      Error in `solve_lsap_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# version_impl basic

    Code
      version_impl_clean()
    Output
      [1] "0.10.17"

# version_impl errors

    Code
      version_impl("invalid")
    Condition
      Error in `version_impl()`:
      ! unused argument ("invalid")

