# `testing/`

Proving the package works, locally and under CRAN's rules.
Where and when any of it runs, and what a result gates, is [`operations/ci/`](/handbook/operations/ci/README.md)'s.

* [`suite/`](suite/): layout, helpers, and the fast loop
* [`snapshots/`](snapshots/): when a snapshot is the right test, and keeping it stable
* [`guards/`](guards/): tests that keep a convention from regressing
* [`revdep/`](revdep/): reverse-dependency checks
