# Sampling a random integer sequence

This function provides a very efficient way to pull an integer random
sample sequence from an integer interval.

## Usage

``` r
sample_seq(low, high, length)
```

## Arguments

- low:

  The lower limit of the interval (inclusive).

- high:

  The higher limit of the interval (inclusive).

- length:

  The length of the sample.

## Value

An increasing numeric vector containing integers, the sample.

## Details

The algorithm runs in `O(length)` expected time, even if `high-low` is
big. It is much faster (but of course less general) than the builtin
`sample` function of R.

## References

Jeffrey Scott Vitter: An Efficient Algorithm for Sequential Random
Sampling, *ACM Transactions on Mathematical Software*, 13/1, 58–67.

## See also

Other other:
[`convex_hull()`](https://r.igraph.org/reference/convex_hull.md),
[`running_mean()`](https://r.igraph.org/reference/running_mean.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
rs <- sample_seq(1, 100000000, 10)
rs
#>  [1] 24102955 26022782 29587179 30741019 37123486 47686946 58669510 73791943
#>  [9] 86033872 87345104
```
