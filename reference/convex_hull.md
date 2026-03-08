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

[`convex_hull_2d`](https://igraph.org/c/html/0.10.17/igraph-Nongraph.html#igraph_convex_hull_2d)

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
#>  [1] 54 50 10 59 37 23 38 30 13 84 62 68 78 17
#> 
#> $rescoords
#>             [,1]         [,2]
#>  [1,] 0.41360641 0.0004089405
#>  [2,] 0.17683178 0.0637957274
#>  [3,] 0.14906443 0.0863903970
#>  [4,] 0.09793522 0.1299316953
#>  [5,] 0.00116260 0.2829708355
#>  [6,] 0.01487720 0.5181068776
#>  [7,] 0.02794066 0.7152773645
#>  [8,] 0.04592172 0.8429875011
#>  [9,] 0.08588107 0.9472874610
#> [10,] 0.17329233 0.9745946184
#> [11,] 0.93064225 0.9971063628
#> [12,] 0.96088367 0.9796547727
#> [13,] 0.96420736 0.2522159629
#> [14,] 0.94734815 0.0134271339
#> 
```
