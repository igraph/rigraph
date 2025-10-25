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
#>  [1] 0.9645606 0.9833405 0.8573243 0.8583842 0.8671172 0.7004469 0.8724793
#>  [8] 0.8925446 0.9656338 0.9426489 0.9994651 0.4932614 0.9953153 0.8587619
#> [15] 0.9753917 0.8833000 0.7919691 0.9229842 0.9505931 0.9148534
```
