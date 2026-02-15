# Dimensionality selection for singular values using profile likelihood.

Select the number of significant singular values, by finding the ‘elbow’
of the scree plot, in a principled way.

## Usage

``` r
dim_select(sv)
```

## Arguments

- sv:

  A numeric vector, the ordered singular values.

## Value

A numeric scalar, the estimate of \\d\\.

## Details

The input of the function is a numeric vector which contains the measure
of ‘importance’ for each dimension.

For spectral embedding, these are the singular values of the adjacency
matrix. The singular values are assumed to be generated from a Gaussian
mixture distribution with two components that have different means and
same variance. The dimensionality \\d\\ is chosen to maximize the
likelihood when the \\d\\ largest singular values are assigned to one
component of the mixture and the rest of the singular values assigned to
the other component.

This function can also be used for the general separation problem, where
we assume that the left and the right of the vector are coming from two
Normal distributions, with different means, and we want to know their
border. See examples below.

## Related documentation in the C library

[`dim_select`](https://igraph.org/c/html/0.10.17/igraph-Embedding.html#igraph_dim_select)

## References

M. Zhu, and A. Ghodsi (2006). Automatic dimensionality selection from
the scree plot via the use of profile likelihood. *Computational
Statistics and Data Analysis*, Vol. 51, 918–930.

## See also

[`embed_adjacency_matrix()`](https://r.igraph.org/reference/embed_adjacency_matrix.md)

Other embedding:
[`embed_adjacency_matrix()`](https://r.igraph.org/reference/embed_adjacency_matrix.md),
[`embed_laplacian_matrix()`](https://r.igraph.org/reference/embed_laplacian_matrix.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# Generate the two groups of singular values with
# Gaussian mixture of two components that have different means
sing.vals <- c(rnorm(10, mean = 1, sd = 1), rnorm(10, mean = 3, sd = 1))
dim.chosen <- dim_select(sing.vals)
dim.chosen
#> [1] 18

# Sample random vectors with multivariate normal distribution
# and normalize to unit length
lpvs <- matrix(rnorm(200), 10, 20)
lpvs <- apply(lpvs, 2, function(x) {
  (abs(x) / sqrt(sum(x^2)))
})
RDP.graph <- sample_dot_product(lpvs)
dim_select(embed_adjacency_matrix(RDP.graph, 10)$D)
#> [1] 1

# Sample random vectors with the Dirichlet distribution
lpvs.dir <- sample_dirichlet(n = 20, rep(1, 10))
RDP.graph.2 <- sample_dot_product(lpvs.dir)
dim_select(embed_adjacency_matrix(RDP.graph.2, 10)$D)
#> [1] 1

# Sample random vectors from hypersphere with radius 1.
lpvs.sph <- sample_sphere_surface(dim = 10, n = 20, radius = 1)
RDP.graph.3 <- sample_dot_product(lpvs.sph)
dim_select(embed_adjacency_matrix(RDP.graph.3, 10)$D)
#> [1] 1
```
