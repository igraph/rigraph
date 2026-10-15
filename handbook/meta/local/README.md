# What this repository decides

The choices the shared rules ([`meta/handbook/`](/handbook/meta/handbook/README.md)) leave open, answered for this repository,
and the rules it adopts beyond the shared ones.
This is the one page under `meta/` that answers for this repository;
the shared pages beside it point to their home, [`cynkra/handbook-tools`](https://github.com/cynkra/handbook-tools),
and [`.handbook-source`](/.handbook-source) names the state of the source this handbook was last checked against.

**Intent and status.**
Work not done yet lives in the issue tracker and in pull requests; there is no plan directory.
The status of the vendoring series lives in its refs and the per-commit verdicts ([`branches/model/`](/handbook/branches/model/README.md)).

**Evidence.**
[`experiments/`](/experiments/README.md) in the shared shape, its `README.md` the registry.

**What this repository does not author.**
The vendored C library under `src/vendor/cigraph/` ([`architecture/engine/`](/handbook/architecture/engine/README.md)),
the Stimulus subrepo under `tools/py-stimulus/`,
the generated R/C interface `R/aaa-*.R` and `src/rinterface.c` ([`architecture/stimulus/`](/handbook/architecture/stimulus/README.md)),
`src/cpp11.cpp` and `R/cpp11.R`, `NEWS.md` (fledge), the `man/` pages (roxygen2), the snapshots under `tests/testthat/_snaps/`,
and the reports under `revdep/`.
`.handbook-ignore` names them where the checks should skip them, each with its reason.
The series tooling under `scripts/` and `.claude/skills/series-*` is ported from duckdb-r, and `.series-source` records from where.

**The comment budget.**
R comments follow air's 80 columns (`air.toml`), C and C++ the surrounding file, shell scripts the duckdb-r originals they were ported from.

**Who the text may name.**
No rule yet; the handbook as written names repositories and roles, not people.

**The language of the prose and of the domain.**
American English, as the reference pages already write it ("neighbor", "color");
graph-theory terms follow the igraph C library's documentation.

**Rules adopted beyond the shared ones.**

* **No em dashes** in what is written from now on.
  A comma, a colon, a semicolon, or a parenthesis says the same thing.
  The tree predates the rule in places, and `.handbook-ignore` exempts those paths rather than rewriting them;
  a file ported from duckdb-r keeps its source's punctuation, so that a resync stays a clean diff.

**Documents shipped without the tree.**
`README.md` and the vignettes ship in the package tarball, which excludes `handbook/`;
they point to the site, https://r.igraph.org/, rather than into the tree.

**Enforcement.**
`.github/workflows/handbook.yaml` runs the check script and checks the carried files against `cynkra/handbook-tools` on every pull request.
