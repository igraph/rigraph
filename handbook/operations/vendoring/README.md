# `vendoring/`

How upstream igraph becomes `src/vendor/cigraph/`, one commit at a time.

**The copy is advanced, never edited.**
Every change to the vendored tree arrives as a vendor commit or as a `patch/` entry,
so the copy's history stays an audit trail of upstream's.

* [`model/`](model/): why vendor, and the invariants a series keeps
* [`pipeline/`](pipeline/): the scripts that turn one upstream commit into one vendor commit
* [`adaptation/`](adaptation/): how the R side follows a change in the C library
* [`series-loop/`](series-loop/): the routine that vendors, judges and repairs
* [`troubleshooting/`](troubleshooting/): when a vendoring run or a series commit is red
