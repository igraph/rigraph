# Traps, all paid for once already

*Reference for [`series-loop`](../SKILL.md), read before a vendor run, a local build, a replay, or a port that conflicts.*

Some were paid for in rigraph's own dry runs, most in duckdb-r, whose scripts these are.

- **Relative paths resolve against the buffer.**
  `vendor-one.sh` changes into `VENDOR_REPO` before it clones the upstream clone,
  so a relative clone path names a directory inside the buffer worktree, or none.
  Pass absolute paths for both.
- **The replay must be a local branch, with its tags.**
  The vendor run clones the clone, and only branches travel:
  a replay held as `refs/remotes/…/replay-1.0.1` alone is left behind, and the run stops on a base it cannot find.
  A replay fetched with `--no-tags` vendors other version headers than one fetched with them ([`0-setup.md`](0-setup.md)).
- **Clean every build product between local builds**: `git clean -fdx -- src/`.
  An object or dependency file built against another engine links or builds wrong.
  `git clean` never touches tracked files, so uncommitted *edits* survive,
  but an uncommitted *new* file under `src/` is deleted: commit or stage it first.
- **The style gate must be clean.**
  The per-commit gate's `clean` stage ([`scripts/rcc-one.sh`](/scripts/rcc-one.sh)) turns any diff
  left by `air format .`, roxygen or the snapshot update into a failure, and no local build shows it.
  In duckdb-r one unsorted `#include` turned 858 commits red.
- **Never `git reset --hard` while HEAD is on a branch you keep**: detach first.
  A probe once truncated the working branch to its own position.
- **Restore whole directories, not touched files**, when replaying over a base that owns them (`.github/` in particular).
- **Generated files conflict on ports, and the answer is to regenerate rather than to merge.**
  `cpp11::cpp_register()` writes both halves of the binding from `DESCRIPTION`'s `Package:`,
  so the series spells every entry point for `igraph.dev` and `main` for `igraph`,
  and a ported commit that registers a new function conflicts there.
  `R/cpp11.R` usually merges cleanly and is wrong when it does, carrying `main`'s `.Call()` names,
  so it is regenerated and staged with the other half whether or not git flagged it:

  ```sh
  git checkout HEAD -- src/cpp11.cpp R/cpp11.R
  Rscript -e 'cpp11::cpp_register()'
  git add src/cpp11.cpp R/cpp11.R
  ```

  `src/rinterface.c` and `R/aaa-*.R` are Stimulus output for the series' engine, which is not `main`'s:
  resolve the conflict in `tools/stimulus/` first, then regenerate on the series' tree and stage the result:

  ```sh
  git checkout HEAD -- src/rinterface.c 'R/aaa-*.R'
  make -f Makefile-cigraph DOCKER= src/rinterface.c .build/r-wrappers.stamp
  git add src/rinterface.c 'R/aaa-*.R'
  ```

  Both targets depend on `venv`, which is never a file, so make regenerates them whatever the timestamps say.
  The per-commit `regen` gate fails any generated file that does not reproduce from its sources,
  so a hand-merged one is caught a CI cycle later.
  `git rerere` does not carry these across firings, which run in fresh clones.
