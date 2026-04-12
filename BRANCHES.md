# Branching Strategy

Version numbers are given at the time of writing (April 2026) and may be
outdated by the time you read this. The branching strategy is expected
to remain stable.

## Package Components

The R package is a **monorepo without submodules**, combining several
components in a single repository. This design accommodates R
development conventions (`R CMD build`, CRAN compliance).

The three main components are:

1.  **igraph C core** (`src/vendor/cigraph/`): the vendored C library.
    It is tracked from upstream `main` of `igraph/igraph`. Never modify
    this directory directly — use the `patch/` mechanism instead.

2.  **R code and tests** (`R/`, `tests/`): the native R interface and
    test suite.

3.  **CI/CD infrastructure** (`.github/workflows/`, build scripts):
    build, test, and release automation.

### Directory tree

    rigraph/
    ├── R/                              # R code
    ├── tests/
    │   └── testthat/                   # R unit tests
    ├── src/
    │   ├── *.cpp                       # Glue code — R ↔ igraph C bridge
    │   └── vendor/
    │       ├── cigraph/                # Vendored igraph C core
    │       └── igraph_version.h        # Generated version header
    ├── patch/                          # R-specific patches applied to src/vendor/cigraph/
    ├── .github/
    │   └── workflows/
    │       ├── vendor.yaml             # Hourly automated vendoring
    │       └── …                       # Other CI/CD workflows
    ├── scripts/
    │   ├── vendor-one.sh               # CI commit-by-commit vendoring script
    │   └── vendor.sh                   # Manual vendoring script
    └── DESCRIPTION                     # Package metadata

## Overview

Two moving parts work together to produce the published R package:

``` txt
krlmlr/igraph        krlmlr/rigraph          igraph/rigraph        CRAN / r-universe
(upstream C)         (CI/CD fork)            (canonical R pkg)
─────────────        ──────────────          ───────────────       ─────────────────
main            ──►  main-dev           ──►  main               ──►  igraph (CRAN / r-universe)
```

At the time of writing, krlmlr/igraph contains a replay of the changes
from 0.10.17 to 1.0.1 using a series of self-contained commits. When the
migration to 1.0.1 is complete, upstream will switch to igraph/igraph.

The arrow from upstream to the CI/CD fork represents automated
vendoring; the arrow from the fork to the canonical repo represents the
release merge. Patches from `patch/` are applied to the vendored C code
during every vendor run (see [Patch Stack](#patch-stack) below).

## Repositories

This package lives in two GitHub repositories:

- **`igraph/rigraph`** — the canonical repository. Releases are
  published to CRAN and r-universe from here.
- **`krlmlr/rigraph`** — a disconnected fork used exclusively for CI/CD,
  so that automated runs do not consume the `igraph` organization’s
  GitHub Actions quota. The development (`main-dev`) branch lives here.

The C library is vendored from **`krlmlr/igraph`** (referred to as
*upstream*) into `krlmlr/rigraph`. The R code that wraps it lives in
`igraph/rigraph` and is synchronized with the dev branch.

## Branch Overview

There is a single active mainline tracking `krlmlr/igraph@main-dev` (the
replay of the changes from 0.10.17 to 1.0.1 using a series of
self-contained commits).

| Branch     | Repo             | Purpose                                                            |
|------------|------------------|--------------------------------------------------------------------|
| `main-dev` | `krlmlr/rigraph` | Source of truth for R code, tests, CI/CD; stable baseline          |
| `main-dev` | `krlmlr/rigraph` | Vendored dev (upstream `main-dev`); published as development build |

### Branch structure

    igraph/rigraph                          krlmlr/rigraph
    ──────────────                          ──────────────

    main  ────────────────────────────────────────────►
     │    source of truth for R code                  │
     │                                                ▼
     │                                       main-dev          ← bleeding edge
     │                                       vendor commits land here first
     │
     ▼
    main  (release tag)

## Source of Truth

`main` in `igraph/rigraph` is the **source of truth** for the R code,
tests, and CI/CD infrastructure. Vendored C sources are sourced from
`krlmlr/igraph@main-dev` and land in `krlmlr/rigraph@main-dev` first.

## Automated Vendoring

CI/CD pipelines in `krlmlr/rigraph` unconditionally vendor the C code
from `krlmlr/igraph@main-dev` and build the development package.

The vendoring workflow (`.github/workflows/vendor.yaml`):

- **Schedule**: Runs every hour (`0 * * * *`)
- **Repository restriction**: Only runs in `krlmlr/rigraph` (the CI/CD
  fork)
- **Target branch**: `main-dev` in `krlmlr/rigraph`
- **Manual trigger**: Can be triggered via `workflow_dispatch`

The automation uses `vendor-one.sh` which:

1.  Clones the upstream `igraph/igraph` repository
2.  Checks for new commits since the last vendor commit
3.  Processes up to 30 commits per run (to catch up on backlog)
4.  Applies R-specific patches from the `patch/` directory
5.  Always vendors Git tags (releases)
6.  Only vendors commits with substantial changes

## Manual Vendoring

To test new igraph C functionality locally:

``` bash
# Ensure your clone structure:
# ~/.../
#   igraph/           # Main igraph C repository
#   R/igraph/igraph/  # This repository (krlmlr/rigraph)

# Update igraph C to desired branch/commit
cd ~/.../igraph
git checkout main  # or desired commit

# Run vendoring
cd ../R/igraph/igraph
./vendor.sh

# Build and test
R CMD INSTALL .
```

## Vendor Commits

Vendor commits follow a specific format:

``` text
vendor: Update vendored sources to igraph/igraph@<commit_hash>

Date: <upstream_commit_date>

<original_commit_message_1>
<original_commit_message_2>
...
```

For tagged releases:

``` text
vendor: Update vendored sources (tag v0.11.0) to igraph/igraph@<commit_hash>
```

## Release Process

When a new version of the igraph C library is tagged upstream:

1.  The `vendor.yaml` workflow automatically creates a vendor commit in
    `krlmlr/rigraph@main-dev` with the message
    `vendor: Update vendored sources (tag vX.Y.Z) to igraph/igraph@<sha>`.
2.  Review the pending changes between `main-dev` and `main`.
3.  Open a PR from `krlmlr/rigraph@main-dev` → `igraph/rigraph@main`.
4.  Ensure CI passes and merge the PR.
5.  Bump the DESCRIPTION version to match the upstream tag.
6.  Tag the release and publish to CRAN / r-universe.

## Patch Stack

The upstream C code in `src/vendor/cigraph/` may require R-specific
adjustments. R-specific fixes are maintained as an ordered series of
git-format patches under `patch/`. Every vendor run re-applies the full
stack on top of the freshly vendored sources.

``` txt
  igraph/igraph (upstream)
        │
        │  vendor.sh / vendor-one.sh
        ▼
  src/vendor/cigraph/   ← raw vendored C sources
        │
        │  apply patch/0001-...patch
        │  apply patch/0002-...patch
        │  ...
        ▼
  src/vendor/cigraph/   ← R-ready C sources (committed to branch)
```

Patches are numbered to define their application order. Gaps in the
numbering are normal — they indicate patches previously removed because
the fix was accepted upstream.

When a patch is no longer needed, delete the file. Do not renumber
remaining patches. When adding a new patch, assign it the next available
number and send the same change as a pull request to `igraph/igraph` so
it can be retired eventually.

## Tooling

| Script / Workflow               | Purpose                                                          |
|---------------------------------|------------------------------------------------------------------|
| `vendor.sh`                     | Local manual vendoring from a cloned upstream repo               |
| `vendor-one.sh`                 | CI commit-by-commit vendoring (called by `vendor.yaml`)          |
| `.github/workflows/vendor.yaml` | Hourly vendoring for `main-dev` (restricted to `krlmlr/rigraph`) |
