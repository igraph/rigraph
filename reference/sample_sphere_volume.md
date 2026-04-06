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
#>  [1] 0.7688615 0.8985828 0.9915932 0.8997797 0.8658223 0.9720607 0.9540394
#>  [8] 0.8648418 0.9133877 0.6092935 0.9665875 0.7792550 0.8569189 0.7728835
#> [15] 0.9962108 0.6274424 0.4914820 0.8072766 0.6491814 0.7820460
```
