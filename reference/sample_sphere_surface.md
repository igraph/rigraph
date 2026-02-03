# Sample vectors uniformly from the surface of a sphere

Sample finite-dimensional vectors to use as latent position vectors in
random dot product graphs

## Usage

``` r
sample_sphere_surface(dim, n = 1, radius = 1, positive = TRUE)
```

## Arguments

- dim:

  Integer scalar, the dimension of the random vectors.

- n:

  Integer scalar, the sample size.

- radius:

  Numeric scalar, the radius of the sphere to sample.

- positive:

  Logical scalar, whether to sample from the positive orthant of the
  sphere.

## Value

A `dim` (length of the `alpha` vector for
[`sample_dirichlet()`](https://r.igraph.org/reference/sample_dirichlet.md))
times `n` matrix, whose columns are the sample vectors.

## Details

`sample_sphere_surface()` generates uniform samples from \\S^{dim-1}\\
(the `(dim-1)`-sphere) with radius `radius`, i.e. the Euclidean norm of
the samples equal `radius`.

## Related documentation in the C library

[`sample_sphere_surface()`](https://igraph.org/c/html/latest/igraph-Nongraph.html#igraph_sample_sphere_surface)

## See also

Other latent position vector samplers:
[`sample_dirichlet()`](https://r.igraph.org/reference/sample_dirichlet.md),
[`sample_sphere_volume()`](https://r.igraph.org/reference/sample_sphere_volume.md)

## Examples

``` r
lpvs.sph <- sample_sphere_surface(dim = 10, n = 20, radius = 1)
RDP.graph.3 <- sample_dot_product(lpvs.sph)
vec.norm <- apply(lpvs.sph, 2, function(x) {
  sum(x^2)
})
vec.norm
#>  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
```
