# `operations/`

Running the repository.

**Automation prepares and reports; a person concludes.**
The routines vendor, build and verify, and leave a record of what they did;
the irreversible moves, a landing on `main`, a release, a close, are a human's call.

* [`vendoring/`](vendoring/): how upstream igraph becomes `src/vendor/cigraph/`, one commit at a time
* [`ci/`](ci/): the workflows, and the per-commit judge of a series
* [`releases/`](releases/): from `main` to CRAN
* [`review/`](review/): pull-request flow
* [`triage/`](triage/): issue intake
* [`site/`](site/): the pkgdown site
