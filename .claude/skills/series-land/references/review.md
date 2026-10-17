# Reviewing a review pull request

*Reference for the review pull request of [`series-land`](../SKILL.md), read before one is handed to a reviewer;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

A review pull request shows the R side of a series or a landing without its engine, and it is never merged.
A reviewer with a clean context reads it: a session or subagent that has not seen the work, so nobody explains the reasoning to it.
The driver, the session that built the review, hands it this file and the values below, reads the report, and runs the loop at the end.
Everything before the section on this repository is engine-neutral.

## What the driver hands over

* `<pr>`, the pull request, and `<head>`, the SHA its head shows when the review starts.
* `<base>`, the `main` commit the review stands on.
* `<tip>`, the commit the review was cut from: `<S>-green` for a series, the landing's tip for a landing.
* `<from>`, the commit below the first vendor commit, so that `git rev-list --first-parent --reverse <from>..<tip>`
  lists the series or landing commits with the first vendor commit at position 1.
* A checkout with every object fetched, and a scratch directory.

## The brief

You are reviewing a pull request with a clean context.
Judge it from the code and the repository's conventions; nobody will explain the reasoning to you.
Read its description first: it carries the test report, every test the change removes or alters, by the commit that does it.

**What it is.**
The package vendors an engine, a C or C++ library it never edits by hand, and `main` vendors one version of it.
A series replays the engine's upstream history onto that, one vendor commit per upstream commit,
with each R-side adaptation folded into the vendor commit that needed it, and CI judges every commit.
A landing replays the same vendor commits onto `main` itself.
The review shows only what those commits change outside what it hides, without the series' flavor, the name a series is published under.
Each review commit stands for one commit that changes anything there, carries its message,
and names it in a `Series-commit:` or `Landing-commit:` trailer.
The first commit removes every workflow and is not part of the review.
The intent is that every change is needed for, or follows from, the new engine, and that nothing users rely on regresses.

**What it hides, and where to read it.**
It hides the engine, and the generated files `scripts/series-config.sh` says a review hides (`series_review_hidden`).
Read the new engine's headers and the hidden generated files at `<tip>`, and the old engine at `<base>`.
A generated file the review shows is there because it carries the engine's change in R terms.
Report a defect in generated code against the generator's input, never against the file.

**Where things are:**

* the review: `git diff <base> <head> -- . ':(exclude).github/workflows'` and `git log --reverse <base>..<head>`;
* the commit a review commit names, and its position: `git rev-list --first-parent --reverse <from>..<tip>`;
* the conventions: `AGENTS.md`, and the leaves the section on this repository links.

**What to look for, most important first:**

1. The glue against the new engine's API:
   R objects left unprotected across an allocation, ownership and lifetime, use after free,
   an R error, an interrupt or a C++ exception that unwinds through the engine's frames,
   and calls that compile but now mean something else, such as an output the engine now initializes or no longer does,
   or a changed type, default, ordering or signature.
2. The R layer: hand-written R calling a generated wrapper that changed, went away or is new,
   and what users see: return types, errors, defaults, random streams, ordering and deprecations.
   `NEWS.md` is judged against the release on CRAN, not against an earlier review.
3. Tests: deleted, skipped, relaxed, snapshots that moved for no reason the diff gives, and expectations that hang on a seed.
4. Changes that look like adaptation but are unrelated or accidental.
5. Style and convention, as nits only.

**What earlier reviews taught:**

* Review `<head>`, the SHA the pull request shows, never what the branch holds later;
  `gh api repos/<owner>/<repo>/pulls/<pr> --jq .head.sha` reads it.
* Keep to what the pull request changes; a defect in code it leaves alone is not a finding.
* Name finalizer, lock and thread hazards explicitly, or say there are none.
* Build with assertions on wherever the build turns them off.
* Run each changed test file on its own, in a fresh process, because a warning given once per process can hide drift in a later file.
* Look for a skip inside a test's body, not only at its top.

**What you may do.**
Read anything, and run git commands that only read.
Create one worktree in the scratch directory, and remove it when done.
Syntax-check or compile glue against the new headers, and build `<tip>` once into a private library, to settle what reading cannot.
Run anything that might hang or crash in a subprocess with a timeout.
Do not push, create or move refs, comment on GitHub, or edit any checkout but your worktree.

## The report

Findings, most severe first, each with:

* the file and line at `<head>`;
* the review commit, the commit its `Series-commit:` or `Landing-commit:` names, and that commit's position;
* the problem, in one sentence;
* the scenario where it bites: the input or state, then the wrong result;
* how sure you are: verified by compiling or running, traced by reading, or plausible;
* the fix, in one sentence, naming the generator's input for generated code.

Then the defects apart from the nits, and the areas you checked and found sound, so that the absence of a finding means something.
Keep it under about 1,500 words.

## The loop around it

The driver, not the reviewer, acts on the report.

* It verifies every finding against the code, or with a reproduction, before anyone acts on it,
  and drops one that does not hold, saying why.
* A verified defect is fixed where the section on this repository says.
* A superseding review follows once the fixes are in, with `--suffix -v<n>` and a pull request of its own,
  read with this brief by a reviewer with a clean context again.
* The iterations end when a review finds no defects; nits do not keep them going.

## In this repository

The engine is the igraph C library under `src/vendor/cigraph/`.
The glue is the hand-written C and C++ that [`architecture/glue/`](/handbook/architecture/glue/README.md) names.

**Hazards:**

* **PROTECT and UNPROTECT** balance on every path through the glue, error exits included.
* **The `IGRAPH_FINALLY` stack.**
  Every initialized object is pushed with its destructor, the count given to `IGRAPH_FINALLY_CLEAN()` matches on every path,
  and a destructor upstream renamed or re-signed is followed; generated code destroys a graph with `IGRAPH_I_DESTROY()`.
  `R_igraph_finalizer()`, which the generated wrappers run on exit, frees what an error left on the stack.
* **A longjmp through the engine's frames.**
  `IGRAPH_R_CHECK()` hands the engine's errors and warnings to R once the engine has returned,
  and only a `.Call` entry point may use it; the glue's `TOP-LEVEL:` and `HELPER:` comments say which a function is.
  R code also runs while engine frames are live: in a callback into R (`src/rcallback.c`, [`tools/AGENTS.md`](/tools/AGENTS.md)),
  in the attribute handler (`Rx_igraph_attribute_table` in `src/rinterface_extra.c`),
  and in the interruption handler, which checks under `R_ToplevelExec()` so that it frees the stack before R unwinds.
* **R's RNG state.**
  igraph 1.0 no longer brackets its draws with `RNG_BEGIN()` and `RNG_END()`;
  with it, `src/rrandom.c` loads R's state on the first draw of a call, and `IGRAPH_R_CHECK()` and `R_igraph_finalizer()` save it.
  Look for a draw outside `IGRAPH_R_CHECK()`, state left loaded across a callback into R that draws, and an error path that skips the save.
* **cpp11 registration.**
  `src/cpp11.cpp` and `R/cpp11.R`, which `cpp11::cpp_register()` writes, register every `.Call` entry point, and the review hides them.
  Read them at `<tip>` for an entry a removed function left behind, or one a new function lacks.
* **Hand-written R and the generated wrappers.**
  The review shows `R/aaa-*.R`:
  check every caller in `R/` and `tests/` of an `_impl()` whose formals changed, that went away, or that is new.
  A finding on generated code, `R/aaa-*.R` or `src/rinterface.c`, is reported against its entry in `tools/stimulus/*.yaml`,
  or in the vendored `interfaces/functions.yaml` through a `patch/` entry
  ([`architecture/stimulus/`](/handbook/architecture/stimulus/README.md)).
* **Patches under `patch/`**, hidden with the engine; `git diff <base> <tip> -- patch/` shows them.
  Each fixes the engine where it is wrong or does not build here, and changes the vendored tree as it says
  ([`adaptation/`](/handbook/operations/vendoring/adaptation/README.md)).
* **Tests and snapshots.**
  A test whose function upstream removed goes with it, and an `# upstream igraph@<short-sha>:` comment stands where it stood;
  confirm that none covers something R still reaches.
  A snapshot moves only with output confirmed correct ([`testing/snapshots/`](/handbook/testing/snapshots/README.md)),
  and `testthat::test_local(filter = "<name>")` runs one file ([`testing/suite/`](/handbook/testing/suite/README.md)).
* **`NEWS.md`**, which fledge writes from pull request titles ([`operations/releases/`](/handbook/operations/releases/README.md)),
  judged against the igraph release on CRAN.
* **Assertions.**
  R and `src/Makevars.*` compile with `-DNDEBUG`, which removes the engine's `assert()` calls but not `IGRAPH_ASSERT()`.
  A private Makevars with `CPPFLAGS += -UNDEBUG`, named by `R_MAKEVARS_USER`, turns them back on for the build.
  A series' tip installs under its flavor, `igraph.dev` ([`branches/flavors/`](/handbook/branches/flavors/README.md)).
* **Finalizers, locks and threads.**
  The engine is built without thread-local storage (`-DIGRAPH_THREAD_LOCAL=` in `src/Makevars.*`),
  so its error state and its `IGRAPH_FINALLY` stack are global, and the glue takes no lock.
  A graph's C copy lives in an external pointer whose C finalizer, `free_graph()` in `src/rinterface_extra.c`,
  runs in R's garbage collector and destroys the graph, attribute handler included.

**Where findings go.**
A review of the series does not fold its findings into the running series one by one.
The driver verifies each as above, and those that hold are collected on `main-fwd-build`,
together with what the [revdep checks](/handbook/testing/revdep/README.md) find.
A fresh rebuild from that branch makes a new generation of the series, as duckdb-r's `series-forward` skill builds one.
Starting it is a person's decision, and the review does not start it.
A landing's review iterates on landing branches instead, as the skill's *Open the R side for review* says.
