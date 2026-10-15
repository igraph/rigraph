# Traps, all paid for once already

*Reference for [`series-loop`](../SKILL.md), read before a local build, a replay, or a port that conflicts;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

- **Clean every build product between local builds** —
  `git clean -fdx -- src/`.
  A stale object for a source upstream folded into a unity file
  links as a duplicate-symbol error,
  and `.so`, `Makevars.duckdb` and dependency files
  go stale the same way.
  `git clean` never touches tracked files,
  so uncommitted *edits* survive —
  but an uncommitted *new* file under `src/` would be deleted;
  commit or stage it first.
- **clang-format must be clean.**
  The per-commit gate's `clean` stage (`scripts/rcc-one.sh`) turns any diff
  from the style, roxygenize or snapshot steps into a failure.
  One unsorted `#include` once turned 858 commits red;
  no local build shows it.
- **Never `git reset --hard` while HEAD is on a branch you keep** —
  detach first.
  A probe once truncated the working branch to its own position.
- **Restore whole directories, not touched files**,
  when replaying over a base that owns them
  (`.github` in particular).
- **Every buffer still keeps cpp11 where it kept it before #2649**,
  so every vendor commit stage 5 replays conflicts on
  `src/Makevars` and `src/Makevars.win`.
  `scripts/rconfigure.py` is tooling and the buffer sync keeps it level with
  `main`, but `src/Makevars.in` — the template it generates those two from —
  is not, and neither is the vendored cpp11 tree it names.
  So a buffer generates `-Iinclude -I../inst/include` while `-dev` carries
  `-Iinclude -Ivendor`, and the one `PKG_CPPFLAGS` line collides on every pick.
  Resolve toward `-dev`: the buffer's own next vendor run rewrites the file
  anyway, and `-dev` is where the cpp11 headers actually are.
  `git rerere` settles the repeats within one clone and a firing runs in a
  fresh one, so the cost is two resolutions per replayed vendor commit, per
  firing, on every series (`main-build`, `main-fwd-build`,
  `v1.4-andium-build`, `v1.5-variegata-build`, `v2.0-cyanoptera-build`
  all carry `inst/include/cpp11`, 2026-09-27).
  Ending it is re-vendoring cpp11 onto each buffer
  (`.claude/skills/vendor-cpp11/SKILL.md`), not a wider tooling sync:
  moving the include path without moving the headers
  would break the vendor gate's glue compile on the buffer.
- **A `.dd` file naming a header the flavor renamed stops the build
  before the first compile**, and no gate above `install` ever runs:
  `src/include/deps.mk` includes `src/*.dd`, so
  `include/duckdb_types.hpp` on a tree carrying
  `include/duckdb_1_5_dev_types.hpp` is
  "No rule to make target 'include/duckdb_types.hpp', needed by 'cpp11.o'".
  The `.dd` files sit outside `scripts/flavor.patch`, the rename surface,
  so a port that takes a `main` commit touching one writes the mainline
  name onto a flavored tree, and a later reflavor does not reach it.
  `flavor.sh` and `reflavor.sh` now normalize them, which leaves the
  branches seeded before that: check with

  ```sh
  git grep -n 'include/duckdb_types\.hpp' <ref> -- 'src/*.dd'
  ```

  and fold the corrected file into the oldest commit above green.
  `v1.5-variegata-fwd` was seeded this way and its whole first chunk
  would have come back red (2026-09-28).
- **`src/cpp11.cpp` conflicts on every port that adds an entry point,
  and the answer is to regenerate it rather than to merge it.**
  `cpp11::cpp_register()` writes both halves of the binding
  from `DESCRIPTION:Package`,
  so every flavor spells the same entry point differently —
  `_duckdb_rapi_execute` on `main`,
  `_duckdb_dev_rapi_execute`, `_duckdb_1_5_dev_rapi_execute`,
  `_duckdb_2_0_dev_rapi_execute` on the series —
  and the whole `CallEntries[]` table therefore differs from `main`'s
  line for line.
  A ported commit that registers a new function conflicts there on every
  series, and hand-merging it is 150 aligned lines of generated code
  for the sake of one entry.
  Check out the series' side, regenerate, and stage both halves:

  ```sh
  git checkout HEAD -- src/cpp11.cpp
  R -q -e 'cpp11::cpp_register()'
  git add src/cpp11.cpp R/cpp11.R
  ```

  `R/cpp11.R` usually merges cleanly and is wrong when it does —
  it carries `main`'s unflavored `.Call()` name — so it is regenerated
  and staged with the other half whether or not git flagged it.
  `fix(flavor): Check that both halves of the cpp11 binding carry the
  flavor's prefix` (#2832) is what catches a miss, one CI cycle later.
  The generator needs the `krlmlr/cpp11` fork, because CRAN's writes
  `_duckdb.2.0.dev_rapi_execute` for a flavor carrying dots, which is not
  a C identifier, and it needs `decor`:

  ```sh
  R -q -e 'install.packages(c("cpp11", "decor"), repos = c("https://krlmlr.r-universe.dev", getOption("repos")))'
  ```

  `git rerere` does not absorb the repeats across series the way it does
  for `src/Makevars`: each flavor is its own preimage,
  so one resolution is owed per series per port that registers anything.
  The 2026-09-28 firing paid it four times, for `feat(connections): Key
  the driver cache on the engine's path, not R's` (#2627), which adds
  `rapi_canonicalize_path()`.
  Teaching `scripts/series-port.sh` to regenerate and continue by itself
  is the fix; this entry is what the next firing needs until it exists.
