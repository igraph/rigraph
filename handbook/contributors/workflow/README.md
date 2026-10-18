# Workflow

Making a change, from branch to merged.

* A pull request title ends up in `NEWS.md`, grouped by its conventional-commit label, so titles and commits follow that style,
  with backticks around code such as `function_call()` ([`operations/releases/`](/handbook/operations/releases/README.md)).
* Pull requests are squashed, so a clean history within one is not necessary.
* The pull request template asks two things of every contributor:
  to disclose any use of an LLM in preparing the change, and to check the box assigning copyright to the igraph development team,
  without which the pull request is not merged.
* Before resuming work on a pull request, merge its base branch, usually `main`.
* `devtools::document()` after a roxygen change, and `air format .` before a commit
  ([`architecture/r-layer/conventions/`](/handbook/architecture/r-layer/conventions/README.md)).

*To deepen: absorb `CONTRIBUTING.md` § Making Trivial Changes and § Making More Involved Changes.*
