# Sample vectors uniformly from the volume of a sphere

Sample finite-dimensional vectors to use as latent position vectors in
random dot product graphs

## Usage

``` r
sample_sphere_volume(dim, n = 1, ..., radius = 1, positive = TRUE)
```

## Arguments

- dim:

  Integer scalar, the dimension of the random vectors.

- n:

  Integer scalar, the sample size.

- ...:

  These dots are for future extensions and must be empty.

- radius:

  Numeric scalar, the radius of the sphere to sample.

- positive:

  Logical, whether to sample from the positive orthant of the sphere.

## Value

A `dim` (length of the `alpha` vector for
[`sample_dirichlet()`](https://r.igraph.org/reference/sample_dirichlet.md))
times `n` matrix, whose columns are the sample vectors.

## Details

`sample_sphere_volume()` generates uniform samples from \\S^{dim-1}\\
(the `(dim-1)`-sphere) i.e. the Euclidean norm of the samples is smaller
or equal to `radius`.

## Related documentation in the C library

[`sample_sphere_volume()`](https://igraph.org/c/html/0.10.17/igraph-Nongraph.html#igraph_sample_sphere_volume)

## See also

Other latent position vector samplers:
[`sample_dirichlet()`](https://r.igraph.org/reference/sample_dirichlet.md),
[`sample_sphere_surface()`](https://r.igraph.org/reference/sample_sphere_surface.md)

## Examples

``` r
lpvs.sph.vol <- sample_sphere_volume(dim = 10, n = 20, radius = 1)
RDP.graph.4 <- sample_dot_product(lpvs.sph.vol)
vec.norm <- apply(lpvs.sph.vol, 2, function(x) {
  sum(x^2)
})
vec.norm
#>  [1] 0.7877281 0.7171085 0.9518279 0.7578889 0.9594476 0.8536693 0.8357129
#>  [8] 0.9662138 0.7459983 0.6767769 0.9014655 0.9316284 0.9158282 0.8733909
#> [15] 0.9222619 0.9996337 0.5291639 0.7421754 0.8308839 0.1709651
```
