# Title

Namespace collision warning when loading Cascade with igraph ≥ 2.3.0

# Body

When loading **Cascade** alongside **igraph** 2.3.0 or later the following warning appears:

```
Warning: replacing previous import 'igraph::circulant' by 'magic::circulant' when loading 'Cascade'
```

This is a **non-breaking warning** — Cascade continues to work correctly, but the warning may alarm users and will surface in `R CMD check`.

## Root cause

igraph 2.3.0 added `make_circulant()` and a constructor alias `circulant()`.
Because **magic** also exports `circulant()`, R detects a conflict between the two imports when Cascade is loaded.

## Suggested fix

Explicitly import `magic::circulant` in your NAMESPACE so that R resolves the conflict deterministically (and silently):

```r
# In NAMESPACE, or equivalently in a roxygen2 tag somewhere in the package:
importFrom(magic, circulant)
```

That single line removes the warning entirely.

---

*This issue was identified during reverse-dependency checks for the upcoming igraph 2.3.0 release.
See the igraph repository for full analysis: https://github.com/igraph/rigraph*
