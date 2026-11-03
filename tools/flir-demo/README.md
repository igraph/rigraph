# flir migration rules on sample calls

*Handbook: [`architecture/r-layer/conventions/`](/handbook/architecture/r-layer/conventions/README.md) is the node this folder serves.*

`calls.R` holds old-style calls to `degree()`, `sample_gnp()`, `simplify()` and `clique_size_counts()`,
each with a comment saying what the rules should do with it.
`rules/` holds the rules `tools/generate-flir-rules.R` writes for those four functions.

To see the rules at work, rewrite `calls.R` in place from the repository root and read the diff:

```r
flir::fix(
  "tools/flir-demo/calls.R",
  linters = list.files("tools/flir-demo/rules", full.names = TRUE)
)
```

```sh
git diff tools/flir-demo/calls.R
git checkout tools/flir-demo/calls.R
```

`flir::lint()` with the same arguments lists the matches without changing the file.

After a change to the generator or its template, regenerate the rules before running flir again:

```sh
Rscript tools/generate-flir-rules.R tools/flir-demo/rules degree sample_gnp simplify clique_size_counts
```
