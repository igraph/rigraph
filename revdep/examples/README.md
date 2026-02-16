# Reverse Dependency Problem Examples

This directory contains minimal reproducible examples for packages that have newly broken checks compared to the most recent CRAN version of igraph.

## Files

Each issue has two files:
- `*.R` - Runnable R script with the minimal example
- `*.md` - Markdown documentation with example output (reprex-style)

### Issues

1. **cascade-circulant-issue** - Namespace collision between `igraph::circulant` and `magic::circulant`
2. **diagrammer-neighbors-issue** - `neighbors()` now requires exactly one vertex
3. **jewel-integer-issue** - Strict integer validation in `rewire_impl()`
4. **manynet-scalar-issue** - Scalar integer validation in `sample_last_cit()`
5. **rspectral-modularity-issue** - Automatic weight usage in modularity calculations
6. **sfnetworks-from-issue** - `from` parameter must specify exactly one vertex

## Running the Examples

Each R script can be run with:

```r
source("revdep/examples/cascade-circulant-issue.R")
```

Or from the command line:

```bash
Rscript revdep/examples/cascade-circulant-issue.R
```

## Format

The examples follow a simplified format:
- No `cat()` statements for output (comments instead)
- No `tryCatch()` blocks (commented out error cases)
- Clean, runnable code that can be used with `reprex::reprex()`
- Corresponding `.md` files show the expected output

## Summary of Issues

| Package | Issue | Severity | Type |
|---------|-------|----------|------|
| Cascade | Namespace collision warning | Low | Inadvertent behavior change |
| DiagrammeR | `neighbors()` requires single vertex | High | API tightening |
| jewel | Integer validation error | High | Uncovered downstream bug |
| manynet | Scalar integer validation | High | API tightening |
| rSpectral | Modularity test failures | Medium | Behavior change with workaround |
| sfnetworks | `from` requires single vertex | High | API tightening |

See `../problems-analysis.md` for detailed analysis and recommendations.
