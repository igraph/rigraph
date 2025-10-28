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
#>  [1] 0.6650267 0.8489816 0.6526718 0.9728287 0.9282349 0.9893535 0.9137213
#>  [8] 0.9263927 0.8095525 0.7776761 0.2966209 0.6887466 0.9924810 0.9572308
#> [15] 0.9774962 0.9334388 0.7215450 0.8022286 0.7324820 0.9678280
```
