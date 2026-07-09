# Fitting a power-law distribution function to discrete data

**\[deprecated\]**

`power.law.fit()` was renamed to
[`fit_power_law()`](https://r.igraph.org/reference/fit_power_law.md) to
create a more consistent API.

## Usage

``` r
power.law.fit(
  x,
  xmin = NULL,
  start = 2,
  force.continuous = FALSE,
  implementation = c("plfit", "R.mle"),
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

- ...:

  Additional arguments, passed to the maximum likelihood optimizing
  function, [`stats4::mle()`](https://rdrr.io/r/stats4/mle.html), if the
  ‘`R.mle`’ implementation is chosen. It is ignored by the ‘`plfit`’
  implementation.
