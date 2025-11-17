# Sample vectors uniformly from the volume of a sphere

Sample finite-dimensional vectors to use as latent position vectors in
random dot product graphs

## Usage

``` r
sample_sphere_volume(dim, n = 1, radius = 1, positive = TRUE)
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

`sample_sphere_volume()` generates uniform samples from \\S^{dim-1}\\
(the `(dim-1)`-sphere) i.e. the Euclidean norm of the samples is smaller
or equal to `radius`.

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
#>  [1] 0.9266434 0.6261842 0.8358008 0.9854031 0.6848115 0.9345497 0.4008197
#>  [8] 0.7607229 0.6896051 0.9310756 0.9105516 0.9010718 0.9899291 0.9954543
#> [15] 0.8371317 0.9673067 0.5929915 0.7428013 0.7461843 0.6778263
```
