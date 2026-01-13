# Sample from a Dirichlet distribution

Sample finite-dimensional vectors to use as latent position vectors in
random dot product graphs

## Usage

``` r
sample_dirichlet(n, alpha)
```

## Arguments

- n:

  Integer scalar, the sample size.

- alpha:

  Numeric vector, the vector of \\\alpha\\ parameter for the Dirichlet
  distribution.

## Value

A `dim` (length of the `alpha` vector for `sample_dirichlet()`) times
`n` matrix, whose columns are the sample vectors.

## Details

`sample_dirichlet()` generates samples from the Dirichlet distribution
with given \\\alpha\\ parameter. The sample is drawn from
`length(alpha)-1`-simplex.

## Related documentation in the C library

[`sample_dirichlet()`](https://igraph.org/c/html/latest/igraph-Nongraph.html#igraph_sample_dirichlet)

## See also

Other latent position vector samplers:
[`sample_sphere_surface()`](https://r.igraph.org/reference/sample_sphere_surface.md),
[`sample_sphere_volume()`](https://r.igraph.org/reference/sample_sphere_volume.md)

## Examples

``` r
lpvs.dir <- sample_dirichlet(n = 20, alpha = rep(1, 10))
RDP.graph.2 <- sample_dot_product(lpvs.dir)
colSums(lpvs.dir)
#>  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
```
