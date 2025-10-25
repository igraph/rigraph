# Fitting a power-law distribution function to discrete data

`fit_power_law()` fits a power-law distribution to a data set.

## Usage

``` r
fit_power_law(
  x,
  xmin = NULL,
  start = 2,
  force.continuous = FALSE,
  implementation = c("plfit", "R.mle"),
  p.value = FALSE,
  p.precision = NULL,
  ...
)
```

## Arguments

- x:

  The data to fit, a numeric vector. For implementation ‘`R.mle`’ the
  data must be integer values. For the ‘`plfit`’ implementation
  non-integer values might be present and then a continuous power-law
  distribution is fitted.

- xmin:

  Numeric scalar, or `NULL`. The lower bound for fitting the power-law.
  If `NULL`, the smallest value in `x` will be used for the ‘`R.mle`’
  implementation, and its value will be automatically determined for the
  ‘`plfit`’ implementation. This argument makes it possible to fit only
  the tail of the distribution.

- start:

  Numeric scalar. The initial value of the exponent for the minimizing
  function, for the ‘`R.mle`’ implementation. Usually it is safe to
  leave this untouched.

- force.continuous:

  Logical scalar. Whether to force a continuous distribution for the
  ‘`plfit`’ implementation, even if the sample vector contains integer
  values only (by chance). If this argument is false, igraph will assume
  a continuous distribution if at least one sample is non-integer and
  assume a discrete distribution otherwise.

- implementation:

  Character scalar. Which implementation to use. See details below.

- p.value:

  **\[experimental\]**

  Set to `TRUE` to compute the p-value with `implementation = "plfit"`.

- p.precision:

  **\[experimental\]**

  The desired precision of the p-value calculation. The precision
  ultimately depends on the number of resampling attempts. The number of
  resampling trials is determined by 0.25 divided by the square of the
  required precision. For instance, a required precision of 0.01 means
  that 2500 samples will be drawn.

- ...:

  Additional arguments, passed to the maximum likelihood optimizing
  function, [`stats4::mle()`](https://rdrr.io/r/stats4/mle.html), if the
  ‘`R.mle`’ implementation is chosen. It is ignored by the ‘`plfit`’
  implementation.

## Value

Depends on the `implementation` argument. If it is ‘`R.mle`’, then an
object with class ‘`mle`’. It can be used to calculate confidence
intervals and log-likelihood. See
[`stats4::mle-class()`](https://rdrr.io/r/stats4/mle-class.html) for
details.

If `implementation` is ‘`plfit`’, then the result is a named list with
entries:

- continuous:

  Logical scalar, whether the fitted power-law distribution was
  continuous or discrete.

- alpha:

  Numeric scalar, the exponent of the fitted power-law distribution.

- xmin:

  Numeric scalar, the minimum value from which the power-law
  distribution was fitted. In other words, only the values larger than
  `xmin` were used from the input vector.

- logLik:

  Numeric scalar, the log-likelihood of the fitted parameters.

- KS.stat:

  Numeric scalar, the test statistic of a Kolmogorov-Smirnov test that
  compares the fitted distribution with the input vector. Smaller scores
  denote better fit.

- KS.p:

  Only for `p.value = TRUE`. Numeric scalar, the p-value of the
  Kolmogorov-Smirnov test. Small p-values (less than 0.05) indicate that
  the test rejected the hypothesis that the original data could have
  been drawn from the fitted power-law distribution.

## Details

This function fits a power-law distribution to a vector containing
samples from a distribution (that is assumed to follow a power-law of
course). In a power-law distribution, it is generally assumed that
\\P(X=x)\\ is proportional to \\x^{-\alpha}\\, where \\x\\ is a positive
number and \\\alpha\\ is greater than 1. In many real-world cases, the
power-law behaviour kicks in only above a threshold value
\\x\_\text{min}\\. The goal of this function is to determine \\\alpha\\
if \\x\_\text{min}\\ is given, or to determine \\x\_\text{min}\\ and the
corresponding value of \\\alpha\\.

`fit_power_law()` provides two maximum likelihood implementations. If
the `implementation` argument is ‘`R.mle`’, then the BFGS optimization
(see [`stats4::mle()`](https://rdrr.io/r/stats4/mle.html)) algorithm is
applied. The additional arguments are passed to the mle function, so it
is possible to change the optimization method and/or its parameters.
This implementation can *not* to fit the \\x\_\text{min}\\ argument, so
use the ‘`plfit`’ implementation if you want to do that.

The ‘`plfit`’ implementation also uses the maximum likelihood principle
to determine \\\alpha\\ for a given \\x\_\text{min}\\; When
\\x\_\text{min}\\ is not given in advance, the algorithm will attempt to
find its optimal value for which the \\p\\-value of a Kolmogorov-Smirnov
test between the fitted distribution and the original sample is the
largest. The function uses the method of Clauset, Shalizi and Newman to
calculate the parameters of the fitted distribution. See references
below for the details.

**\[experimental\]**

Pass `p.value = TRUE` to include the p-value in the output. This is not
returned by default because the computation may be slow.

## References

Power laws, Pareto distributions and Zipf's law, M. E. J. Newman,
*Contemporary Physics*, 46, 323-351, 2005.

Aaron Clauset, Cosma R .Shalizi and Mark E.J. Newman: Power-law
distributions in empirical data. SIAM Review 51(4):661-703, 2009.

## See also

[`stats4::mle()`](https://rdrr.io/r/stats4/mle.html)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com>

## Examples

``` r
# This should approximately yield the correct exponent 3
g <- sample_pa(1000) # increase this number to have a better estimate
d <- degree(g, mode = "in")
fit1 <- fit_power_law(d + 1, 10)
fit2 <- fit_power_law(d + 1, 10, implementation = "R.mle")

fit1$alpha
#> [1] 2.527759
stats4::coef(fit2)
#>    alpha 
#> 2.527372 
fit1$logLik
#> [1] -55.7596
stats4::logLik(fit2)
#> 'log Lik.' -55.75921 (df=1)
```
