# R/igraph

R/igraph is an R package of the igraph network analysis library.

## Installation

You can install the stable version of R/igraph from CRAN:

``` r
install.packages("igraph")
```

For the development version, you can use R-universe

``` r
options(
  repos = c(
    igraph = 'https://igraph.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'
  )
)
install.packages('igraph')
```

or Github, with the [pak package](https://pak.r-lib.org/):

``` r
pak::pak("igraph/rigraph")
```

When compiling from sources, make sure that you have C, C++ and Fortran
compilers, as well as development packages for `glpk` and `libxml2`. On
Debian/Ubuntu, use `apt install libglpk-dev libxml2-dev`. On Fedora, use
`yum install glpk-devel libxml2-devel`.

For installation from source on Windows, you need to have
[RTools](https://cran.r-project.org/bin/windows/Rtools/) installed. For
versions R \>= 4.0 you can install the dependencies using:

    pacman -Sy mingw-w64-{i686,x86_64}-glpk mingw-w64-{i686,x86_64}-libxml2

## Installation troubleshooting

See the [Installation
FAQ](https://r.igraph.org/articles/installation-troubleshooting).

## Documentation

See the [igraph package’s website](https://r.igraph.org/) for the
complete manual.

A good entry point is the “Get started” vignette, in
[English](https://r.igraph.org/articles/igraph.html) or
[Spanish](https://r.igraph.org/articles/igraph_ES.html).

For an overview of igraph’s functionality see the [reference
index](https://r.igraph.org/reference/index.html). It includes
[experimental
functions](https://r.igraph.org/reference/index.html#experimental-functions)
on which we especially welcome feedback (but feedback on any function is
appreciated)!

## Contributions

Please read our [contribution
guide](https://github.com/igraph/rigraph/blob/dev/CONTRIBUTING.md).

## License

GNU GPL version 2 or later

## Contributors

All contributions to this project are gratefully acknowledged using the
[`allcontributors` package](https://github.com/ropensci/allcontributors)
following the [all-contributors](https://allcontributors.org)
specification. Contributions of any kind are welcome!

### Code

[TABLE]

### Issue Authors

[TABLE]

### Issue Contributors

[TABLE]
