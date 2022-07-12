![R-CMD-check](https://github.com/igraph/rigraph/workflows/R-CMD-check/badge.svg)
![CRAN Downloads](https://cranlogs.r-pkg.org/badges/igraph)

# R/igraph

R/igraph is an R package of the igraph network analysis library.

## Installation

You can install the stable version of R/igraph from CRAN:

```r
install.packages("igraph")
```

For the development version, you can use Github, with the `remotes`
package:

```r
remotes::install_github("igraph/rigraph@master")
```

The code in the `master` branch is automatically generated from the `dev` branch.

For installation from source on Windows, you need to have
[RTools](https://cran.r-project.org/bin/windows/Rtools/) installed.
Additionally, the three system requirements of `glpk`, `libxml2` and `gmp` are
not optional, but hard requirements. For versions R >= 4.0 you can install these
using
```
pacman -Sy mingw-w64-{i686,x86_64}-glpk mingw-w64-{i686,x86_64}-libxml2 mingw-w64-{i686,x86_64}-gmp
```

## Documentation

See the [igraph homepage](https://igraph.org/r/) for the complete manual.

## Contributions

Please read our
[contribution guide](https://github.com/igraph/rigraph/blob/dev/CONTRIBUTING.md).

## License

GNU GPL version 2 or later
