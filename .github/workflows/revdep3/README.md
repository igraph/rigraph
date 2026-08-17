# revdep3: the pair engine

The engine-specific part of the containerized reverse-dependency check;
everything else — planning, image lifecycle, comparison,
collection, artifacts — is shared with revdep4
and documented in `../revdepx/README.md`.

## What this engine does

For each package of a shard, in plan order (heaviest first),
the driver (`../revdepx/shard.R`) calls `check-pair.sh`,
which starts **two containers at the same time**:
one checks the package against the released CRAN version of igraph,
one against the dev build,
each with `R_LIBS` stacking its single-package half library
in front of the universe library baked into the image.
The pair still halves a package's wall clock,
exactly as it did in revdep2 —
what changed is that the halves can no longer see each other.

## Why containers, not more patches

revdep2's two halves shared one host.
R's `parallel` picks its PSOCK port once per session
from the RNG and the clock;
`set.seed()` in examples and tests makes it deterministic,
and two halves starting together drew the same port —
`cia` and `TDApplied` were reported broken with nothing wrong.
The fix (`R_PARALLEL_PORT=20000/30000`) worked,
but it was a patch for one mechanism.
The halves still shared `/tmp`,
the ccache and pak caches, DBus, X, the loopback interface —
every singleton a check may assume it owns.

A container per half ends the class:
own network namespace (any port, twice, no collision),
own PID space, own mounts, own `/tmp`
(bind-mounted from the big disk, discarded per package).
The port variable is gone from the environment entirely,
because nothing needs it any more.

Two side effects are worth having on their own:

- a **memory cap** per container
  (`(RAM − 2 GiB) / 2` per half unless `REVDEPX_MEMORY` says otherwise),
  so a hungry check kills its own container —
  one package's recorded result —
  instead of starving the runner agent
  ("The hosted runner lost communication with the server");
- a **pinned check platform**:
  the halves run under the resolved `r-version` (default oldrel)
  on the fixed base image,
  so results stay comparable across runs
  while the runner image drifts underneath.

## Trade-offs against revdep4

- Wall clock per package is the slower half,
  not the sum — the pair is the faster engine
  for a full sweep with few reusable baselines.
- Both halves always run fresh, here and in revdep4:
  a stored old result from an earlier run
  is a second opinion (`baseline_agrees`),
  never a substitute for the old check.
- Per-half timings remain inseparable
  (both are recorded as the pair's wall clock);
  revdep4 measures real ones.
- Concurrency within a shard is fixed at two checks;
  revdep4 scales with `REVDEPX_WORKERS`.

The two engines publish interchangeable artifacts,
so the choice is per dispatch, not forever:
a revdep4 run can retry a revdep3 run's leftovers,
reuse its baselines,
and start from the universe image it refreshed —
and the other way around.
