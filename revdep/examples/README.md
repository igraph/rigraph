# Reverse Dependency Problem Examples

This directory contains minimal reproducible examples for the three packages that have newly broken checks compared to the most recent CRAN version of igraph.

## Files

- **`cascade-circulant-issue.R`** - Demonstrates the namespace collision between `igraph::circulant` and `magic::circulant`
- **`jewel-integer-issue.R`** - Demonstrates the strict integer validation error in `rewire_impl()`
- **`rspectral-modularity-issue.R`** - Demonstrates the automatic weight usage in modularity calculations

## Running the Examples

Each example is a standalone R script that can be run with:

```r
Rscript cascade-circulant-issue.R
Rscript jewel-integer-issue.R
Rscript rspectral-modularity-issue.R
```

Or from within R:

```r
pkgload::load_all()  # Load the development version of igraph
source("revdep/examples/cascade-circulant-issue.R")
source("revdep/examples/jewel-integer-issue.R")
source("revdep/examples/rspectral-modularity-issue.R")
```

## Summary of Issues

| Package | Issue | Severity | Type |
|---------|-------|----------|------|
| Cascade | Namespace collision warning | Low | Inadvertent behavior change |
| jewel | Integer validation error | High | Uncovered downstream bug |
| rSpectral | Modularity test failures | Medium | Breaking change |

See `../problems-analysis.md` for detailed analysis and recommendations.
