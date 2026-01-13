# Convex hull of a set of vertices

Calculate the convex hull of a set of points, i.e. the covering polygon
that has the smallest area.

## Usage

``` r
convex_hull(data)
```

## Arguments

- data:

  The data points, a numeric matrix with two columns.

## Value

A named list with components:

- resverts:

  The indices of the input vertices that constritute the convex hull.

- rescoords:

  The coordinates of the corners of the convex hull.

## Related documentation in the C library

## References

Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford
Stein. Introduction to Algorithms, Second Edition. MIT Press and
McGraw-Hill, 2001. ISBN 0262032937. Pages 949-955 of section 33.3:
Finding the convex hull.

## See also

Other other:
[`running_mean()`](https://r.igraph.org/reference/running_mean.md),
[`sample_seq()`](https://r.igraph.org/reference/sample_seq.md)

## Author

Tamas Nepusz <ntamas@gmail.com>

## Examples

``` r
M <- cbind(runif(100), runif(100))
convex_hull(M)
#> $resverts
#>  [1] 10 38 27 88 72 84 90 73 16 19 81 46
#> 
#> $rescoords
#>              [,1]        [,2]
#>  [1,] 0.235531409 0.001072066
#>  [2,] 0.126216803 0.019510332
#>  [3,] 0.089983823 0.108878658
#>  [4,] 0.014145369 0.403278272
#>  [5,] 0.004698588 0.672168630
#>  [6,] 0.006506867 0.880128023
#>  [7,] 0.399955332 0.970398800
#>  [8,] 0.932846401 0.981499094
#>  [9,] 0.957504642 0.795799484
#> [10,] 0.979656620 0.571665475
#> [11,] 0.986170822 0.387042148
#> [12,] 0.999093372 0.019301232
#> 
```
