# Open PRs Meta-Review for igraph/rigraph

**Generated:** 2026-01-22  
**Total Open PRs:** 55 (excluding PR #2524 and #2522 which are WIP for this task)

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [High Priority - Ready or Near Ready](#high-priority---ready-or-near-ready)
3. [Active Development - Recent PRs (Oct 2025+)](#active-development---recent-prs-oct-2025)
4. [Documentation and Infrastructure](#documentation-and-infrastructure)
5. [Blocked or Awaiting Decisions](#blocked-or-awaiting-decisions)
6. [Stale PRs - Needs Attention or Closure](#stale-prs---needs-attention-or-closure)
7. [Dependency Map](#dependency-map)

---

## Executive Summary

### PR Status Overview

- **Ready to merge (mergeable_state: clean)**: 2 PRs
- **Needs CI fixes (mergeable_state: unstable/blocked)**: ~45 PRs
- **Has merge conflicts (mergeable_state: dirty)**: 8 PRs
- **WIP/Draft PRs**: 50 PRs
- **Non-draft PRs**: 5 PRs

### Key Observations

1. **Mass October 2025 Activity**: ~30 PRs created by Copilot bot in late October 2025, focusing on API standardization, parameter naming, and exposing igraph 0.10 functions
2. **API Breaking Changes**: Many PRs involve breaking changes (parameter renames, default changes, return type changes)
3. **Code Generation Focus**: Multiple PRs around autogeneration and Stimulus framework improvements
4. **Very Old PRs**: Several PRs from 2023-2024 that may need rebasing or closing
5. **Common Themes**:
   - Exposing new C library functions to R
   - API consistency and standardization
   - Parameter naming conventions
   - Error handling improvements
   - Test coverage expansion

### Critical Decision Points

- Many PRs depend on a "next" branch strategy for breaking changes
- Need to decide which API changes to bundle together
- Some PRs may be superseded by others (e.g., multiple parameter naming PRs)

---

## High Priority - Ready or Near Ready

### Ready to Merge

#### PR #2515: `feat: improve formatting of error messages from C`
- **Status**: ✅ Non-draft, mergeable_state: clean
- **Created**: 2026-01-06 by @maelle
- **Comments**: 7, Review comments: 3
- **Description**: Improves error message formatting from C library (fixes #2202)
- **Recommendation**: **MERGE NOW** - Clean state, has reviews, addresses a specific issue
- **Changes**: 175 additions, 81 deletions, 5 files

#### PR #2513: `vendor: Update vendored sources`
- **Status**: Non-draft, mergeable_state: unstable (CI issues)
- **Created**: 2025-12-28 by github-actions[bot]
- **Description**: Automated vendoring update
- **Recommendation**: **MERGE AFTER CI FIXES** - Small change (4 additions, 2 deletions)
- **Changes**: 4 additions, 2 deletions, 2 files

### Near Ready - Minor Issues

#### PR #2485: `feat: autogenerate 108 non-callback functions`
- **Status**: Non-draft but mergeable_state: blocked
- **Created**: 2025-11-04 by @Copilot
- **Comments**: 13, Review comments: 4
- **Description**: Major PR autogenerating 108 functions, reducing IGNORE specs from 128 to 19
- **Recommendation**: **NEEDS REVIEW** - Large change, very comprehensive, has detailed progress tracking
- **Changes**: 13,484 additions, 3,875 deletions, 7 files
- **Notes**: All tests passing according to PR description, comprehensive test coverage added

#### PR #2417: `Add make_hypercube()`
- **Status**: Non-draft (unusual - most similar PRs are drafts)
- **Created**: 2025-10-26 by @Copilot
- **Description**: Exposes hypercube graph generator
- **Recommendation**: Review as part of "expose igraph 0.10 functions" batch
- **Potential Group**: Part of graph constructors batch (see #2410, #2418, #2419)

---

## Active Development - Recent PRs (Oct 2025+)

This section contains ~30 PRs created in October 2025, primarily by the Copilot bot, focusing on API improvements and igraph 0.10 feature exposure.

### API Standardization & Parameter Naming

These PRs aim to create consistent naming conventions across the API. **Likely interdependent** and should be reviewed together.

#### PR #2458: Standardize vertex selector parameter name to `vids`
- **Created**: 2025-10-28, Draft
- **Recommendation**: Bundle with other parameter naming PRs
- **May conflict with**: #2450 (contradictory naming - one says `vids`, other says `vertices`)

#### PR #2456: Standardize algorithm parameter names from `algo`/`method` to `algorithm`
- **Created**: 2025-10-28, Draft
- **Recommendation**: Part of naming standardization batch

#### PR #2450: Standardize API parameter naming: `nodes` → `n`, `vids` → `vertices`
- **Created**: 2025-10-27, Draft
- **⚠️ CONFLICT**: Contradicts #2458 which standardizes TO `vids`
- **Recommendation**: **RESOLVE CONFLICT** - Decide on `vids` vs `vertices` first

### Breaking Changes & Deprecations

#### PR #2457: `fix: Add deprecation warnings for inconsistent mode parameter defaults`
- **Created**: 2025-10-28, Draft
- **Recommendation**: Should go in breaking change release (likely "next" branch)

#### PR #2455: `fix: Return parent as numeric vector in bfs() and dfs() instead of igraph.vs`
- **Created**: 2025-10-28, Draft
- **Type**: Breaking change
- **Recommendation**: Bundle with other breaking changes for next major release

#### PR #2453: `feat: make graph constructors default to undirected for consistency`
- **Created**: 2025-10-28, Draft
- **Type**: Breaking change
- **Recommendation**: Major breaking change, needs careful consideration

#### PR #2452: `feat: error when adding named vertices to non-empty unnamed graphs`
- **Created**: 2025-10-28, Draft
- **Type**: Breaking change (new error conditions)
- **Recommendation**: Part of consistency improvements

### New Feature Exposure (igraph 0.10 functions)

These PRs expose new functionality from the underlying igraph C library.

#### PR #2410: `feat: expose igraph 0.10 functions`
- **Created**: 2025-10-26, Draft
- **Functions**: `any_mutual()`, `invalidate_cache()`, and 8 generator functions
- **Recommendation**: **COORDINATE** with related feature PRs (#2417-2420, #2426)

#### PR #2420: `Expose igraph_degree_correlation_vector() as knnk()`
- **Created**: 2025-10-26, Draft
- **Recommendation**: Part of igraph 0.10 feature batch

#### PR #2419: `Add make_tri_lattice()` (triangular lattice generator)
- **Created**: 2025-10-26, Draft
- **Group**: Graph constructors

#### PR #2418: `feat: add make_hex_lattice() and hex_lattice() functions`
- **Created**: 2025-10-26, Draft
- **Group**: Graph constructors

#### PR #2417: `Add make_hypercube()`
- **Created**: 2025-10-26, Non-draft
- **Group**: Graph constructors

#### PR #2411: `feat: Add graph_join() function to R interface`
- **Created**: 2025-10-26, Draft
- **Recommendation**: Part of igraph 0.10 feature batch

#### PR #2408: `feat: Expose widest paths functions`
- **Created**: 2025-10-26, Draft
- **Functions**: `widest_paths()` and `widest_path_widths()`
- **Recommendation**: Part of igraph 0.10 feature batch

#### PR #2404: `feat: expose mycielskian() and make_mycielski_graph()`
- **Created**: 2025-10-26, Draft
- **Recommendation**: Part of graph constructors batch

#### PR #2445: `feat: expose igraph_motifs_randesu_callback() to R`
- **Created**: 2025-10-27, Draft
- **Purpose**: Efficient motif sampling
- **Recommendation**: Review separately - involves callbacks

#### PR #2426: `feat: add as_veincidence_matrix()`
- **Created**: 2025-10-26, Draft
- **Description**: Vertex-edge incidence matrices
- **Recommendation**: Part of utility functions batch

### Bug Fixes & Improvements

#### PR #2432: `fix: Support character labels in assortativity_nominal()`
- **Created**: 2025-10-26, Draft
- **Recommendation**: Small fix, should be easy to merge

#### PR #2427: `fix: biconnected_components() returns invalid result fields`
- **Created**: 2025-10-26, Draft
- **Type**: Bug fix
- **Recommendation**: Should be merged relatively soon

#### PR #2441: `fix: remove problematic defaults from sample_last_cit() parameters`
- **Created**: 2025-10-26, Draft
- **Type**: API fix
- **Recommendation**: Part of API cleanup batch

#### PR #2440: `feat: add as.vector parameter to as_edgelist()`
- **Created**: 2025-10-26, Draft
- **Recommendation**: Small enhancement, low risk

#### PR #2436: `feat: standardize optional vertex parameters to use NULL default`
- **Created**: 2025-10-26, Draft
- **Recommendation**: Part of API standardization

### Infrastructure & Dependencies

#### PR #2431: `Use vctrs for vector recycling`
- **Created**: 2025-10-26, Draft
- **Type**: Infrastructure change (new dependency)
- **Recommendation**: **NEEDS CAREFUL REVIEW** - Adds new dependency

### Comparison & Review PRs

#### PR #2421: `Changes between main and next for review`
- **Created**: 2025-10-26 by @krlmlr, Draft
- **Purpose**: Comparing branches for release planning
- **Recommendation**: **REVIEW ONLY** - Not meant to be merged as-is

### Work In Progress

#### PR #2439: `[WIP] Fix functions ignoring return.vs.es option`
- **Created**: 2025-10-26, Draft
- **Status**: Explicitly WIP
- **Recommendation**: Wait for author to complete

#### PR #2437: `test: Snapshot updates for rcc-smoke (null)`
- **Created**: 2025-10-26, Draft by github-actions[bot]
- **Recommendation**: Automated test updates, review and merge if valid

---

## Documentation and Infrastructure

### Documentation

#### PR #2518: `Automatic linking to C docs`
- **Status**: Draft, mergeable_state: dirty (merge conflicts)
- **Created**: 2026-01-13 by @maelle
- **Comments**: 0, Review comments: 1
- **Description**: POC for automatic linking to C documentation
- **Changes**: 1,931 additions, 387 deletions, 520 files
- **Recommendation**: **NEEDS REBASE** - Large documentation improvement, has conflicts
- **Notes**: Based on treesitter for finding function calls

#### PR #2500: `docs(revdep): Analyze and document reverse dependency problems`
- **Created**: 2025-11-16 by @Copilot, Draft
- **Recommendation**: Important for CRAN releases, should be prioritized

#### PR #1453: `docs: add example for consensus_tree()`
- **Created**: 2024-08-20, Draft
- **Age**: 17 months old
- **Recommendation**: Small doc addition, should be easy to merge or close

### Build & Infrastructure

#### PR #2469: `fix: update wrapper functions for C API parameter changes`
- **Created**: 2025-11-01 by @Copilot, Draft
- **Recommendation**: Likely needed for C library update

#### PR #1577: `chore: Add checks to generated code`
- **Created**: 2024-11-07, Non-draft
- **Labels**: blocked
- **Age**: 14 months old
- **Recommendation**: **BLOCKED** - Resolve blocker or close

#### PR #1559: `chore: update arpack to arpack-ng 3.9.1`
- **Created**: 2024-10-21, Draft
- **Labels**: hackathon-topic
- **Age**: 15 months old
- **Recommendation**: **NEEDS DECISION** - Dependency update, may need rebasing

#### PR #1871: `chore: fix with {flir}`
- **Created**: 2025-06-10, Draft
- **Labels**: hackathon-topic, release-followup
- **Age**: 7 months old
- **Recommendation**: Review or close

### Deprecation & Cleanup

#### PR #2187: `chore: remove console() and tkplot()`
- **Created**: 2025-10-03, Non-draft
- **Labels**: release-followup
- **Age**: 3 months old
- **Recommendation**: Breaking change, needs to go in next major release

#### PR #2002: `chore: rm some tk stuff`
- **Created**: 2025-07-22, Draft
- **Labels**: hackathon-topic, release-followup
- **Recommendation**: Related to #2187, bundle together

#### PR #1502: `chore: stricter deprecation for layout.spring() and layout.svd()`
- **Created**: 2024-09-10, Draft
- **Labels**: lifecycle
- **Age**: 16 months old
- **Recommendation**: Part of deprecation cycle, review or close

---

## Blocked or Awaiting Decisions

### Explicitly Blocked

#### PR #1577: `chore: Add checks to generated code`
- **Created**: 2024-11-07, Non-draft
- **Labels**: ⛔ blocked
- **Age**: 14 months old
- **Recommendation**: **RESOLVE BLOCKER OR CLOSE**

#### PR #1401: `test: Test adding vertex names`
- **Created**: 2024-06-11, Draft
- **Labels**: ⛔ blocked
- **Age**: 19 months old
- **Recommendation**: **RESOLVE BLOCKER OR CLOSE**

### Needs Design Decisions

#### PR #1971: `[WIP] Adding vertex names when a named and unnamed graph are combined?`
- **Created**: 2025-07-10, Draft
- **Status**: Explicitly WIP, design question
- **Age**: 6 months old
- **Recommendation**: **NEEDS DESIGN DECISION** - How should graph combination handle names?

#### PR #2375: `[WIP] Remove .Call() usage from user code`
- **Created**: 2025-10-25, Draft
- **Age**: 3 months old
- **Recommendation**: **NEEDS REVIEW** - Infrastructure improvement

### Stimulus/Code Generation

#### PR #2127: `chore: start work on community_leading_eigenvector()`
- **Created**: 2025-09-08, Draft
- **Labels**: stimulus
- **Age**: 4 months old
- **Recommendation**: May be superseded by #2485

#### PR #2100: `chore: autogenerate igraph_incident()`
- **Created**: 2025-09-01, Non-draft
- **Labels**: stimulus, hackathon-topic
- **Age**: 4 months old
- **Recommendation**: May be superseded by #2485

---

## Stale PRs - Needs Attention or Closure

### Very Old (2023-2024)

#### PR #758: `feat!: Accept numeric edge IDs`
- **Created**: 2023-04-02, Draft
- **Age**: **33 months old** 🔴
- **Type**: Breaking change
- **Recommendation**: **REVIEW OR CLOSE** - Very old breaking change, may be outdated

#### PR #942: `fix: limit the rate of interruption checks`
- **Created**: 2023-11-04, Draft
- **Age**: **26 months old** 🔴
- **Recommendation**: **REVIEW OR CLOSE** - Performance fix, may need rebasing

#### PR #1401: `test: Test adding vertex names`
- **Created**: 2024-06-11, Draft, Blocked
- **Age**: 19 months old
- **Recommendation**: **RESOLVE OR CLOSE**

#### PR #1502: `chore: stricter deprecation for layout.spring() and layout.svd()`
- **Created**: 2024-09-10, Draft
- **Age**: 16 months old
- **Recommendation**: **REVIEW OR CLOSE**

#### PR #1577: `chore: Add checks to generated code`
- **Created**: 2024-11-07, Blocked
- **Age**: 14 months old
- **Recommendation**: **RESOLVE OR CLOSE**

### Old (6-12 months)

#### PR #1871: `chore: fix with {flir}`
- **Created**: 2025-06-10, Draft
- **Age**: 7 months old

#### PR #1894: `fix: Allow matrix attributes by checking their vector size`
- **Created**: 2025-06-26, Draft
- **Age**: 7 months old

#### PR #1932: `feat: add error if adding vertices results in duplicated names`
- **Created**: 2025-07-03, Non-draft
- **Age**: 6 months old

#### PR #1968: `feat: implement read/write graphs from/to string`
- **Created**: 2025-07-09, Draft
- **Age**: 6 months old

#### PR #1971: `[WIP] Adding vertex names when a named and unnamed graph are combined?`
- **Created**: 2025-07-10, Draft
- **Age**: 6 months old

#### PR #1981: `feat: added simple check to graph_from_literal()`
- **Created**: 2025-07-15, Draft
- **Age**: 6 months old
- **Labels**: release-followup

#### PR #2003: `chore: create check_vertex()`
- **Created**: 2025-07-22, Draft
- **Labels**: release-followup
- **Age**: 6 months old

#### PR #2006: `chore: improve errors in iterators.R`
- **Created**: 2025-07-22, Non-draft
- **Age**: 6 months old

#### PR #2010: `test: Snapshot updates for rcc-smoke (null)`
- **Created**: 2025-07-22, Non-draft
- **Age**: 6 months old
- **Type**: Automated test update

### Medium Age (3-6 months)

#### PR #2058: `fix: Fix tests on next branch`
- **Created**: 2025-08-17, Draft
- **Age**: 5 months old

#### PR #2100: `chore: autogenerate igraph_incident()`
- **Created**: 2025-09-01, Non-draft
- **Age**: 4 months old

#### PR #2127: `chore: start work on community_leading_eigenvector()`
- **Created**: 2025-09-08, Draft
- **Age**: 4 months old

#### PR #2187: `chore: remove console() and tkplot()`
- **Created**: 2025-10-03, Non-draft
- **Age**: 3 months old

#### PR #2219: `fix NA check for lower upper tri`
- **Created**: 2025-10-23, Non-draft
- **Labels**: hackathon-topic
- **Age**: 3 months old

---

## Dependency Map

### Semantic Dependencies & Groupings

#### Group 1: Parameter Naming Standardization (⚠️ CONFLICTS)
**Decision needed: Resolve naming conflicts first**

- #2458: Standardize to `vids` ⚠️
- #2450: Standardize to `vertices` ⚠️ (CONFLICTS with #2458)
- #2456: Standardize algorithm params to `algorithm`
- #2436: Standardize optional vertex parameters to `NULL` default

**Recommendation**: Decide on unified naming convention, then merge PRs in order

#### Group 2: igraph 0.10 Function Exposure - Graph Constructors
**Can be merged independently but should be reviewed together for consistency**

- #2410: Core igraph 0.10 functions (includes 8 generators)
- #2417: `make_hypercube()` (non-draft)
- #2418: `make_hex_lattice()` and `hex_lattice()`
- #2419: `make_tri_lattice()`
- #2404: `mycielskian()` and `make_mycielski_graph()`

**Recommendation**: Review all together for API consistency, can merge incrementally

#### Group 3: igraph 0.10 Function Exposure - Other Functions
**Can be merged independently**

- #2420: `knnk()` (degree correlation)
- #2408: Widest paths functions
- #2411: `graph_join()`
- #2426: `as_veincidence_matrix()`
- #2445: Motif sampling (involves callbacks, separate review)

#### Group 4: Breaking Changes for Next Major Release
**Should be bundled together or coordinated**

- #2453: Graph constructors default to undirected
- #2455: `bfs()`/`dfs()` return numeric instead of igraph.vs
- #2457: Deprecation warnings for `mode` parameter
- #2452: Error on adding named vertices to unnamed graphs
- #2187: Remove `console()` and `tkplot()`
- #2002: Remove tk stuff (related to #2187)
- Possibly: #758 (numeric edge IDs) if still relevant

#### Group 5: Bug Fixes - Can Merge Independently
**Low risk, should be prioritized**

- #2432: Character labels in `assortativity_nominal()`
- #2427: Fix `biconnected_components()` result fields
- #2441: Remove problematic defaults from `sample_last_cit()`
- #2219: NA check for lower/upper tri

#### Group 6: Infrastructure & Code Generation
**May have dependencies**

- #2485: Autogenerate 108 functions (MAJOR - review first)
- #2469: Update wrappers for C API changes
- #2375: Remove `.Call()` usage from user code
- #2127: Work on `community_leading_eigenvector()` (may be superseded by #2485)
- #2100: Autogenerate `igraph_incident()` (may be superseded by #2485)

#### Group 7: Documentation
**Can be merged independently**

- #2518: Automatic C docs linking (needs rebase)
- #2500: Reverse dependency analysis
- #1453: Add example for `consensus_tree()`

### Technical Dependencies

1. **#2485 may supersede**: #2127, #2100 (check if functions already generated)
2. **#2458 and #2450 conflict**: Need to resolve `vids` vs `vertices` naming
3. **Breaking changes** (#2453, #2455, #2457, #2452, #2187, #2002): Should go through "next" branch together
4. **#2421 is special**: Review-only PR comparing main and next branches

---

## Recommendations

### Immediate Actions (Next 2 Weeks)

1. **MERGE NOW**:
   - #2515: Error message formatting (clean, reviewed)
   - #2513: Vendor update (after CI fixes)

2. **REVIEW URGENTLY**:
   - #2485: Autogenerate 108 functions - **MASSIVE PR**, needs thorough review
   - Determine if #2485 supersedes #2100, #2127

3. **RESOLVE CONFLICTS**:
   - #2458 vs #2450: Decide on `vids` or `vertices`
   - Check #2421 to understand main vs next strategy

4. **UNBLOCK**:
   - #1577: Add checks to generated code - resolve blocker or close
   - #1401: Test vertex names - resolve blocker or close

### Short Term (Next Month)

1. **Group Review - igraph 0.10 Functions**:
   - Review #2410, #2417-2420, #2404, #2408, #2411, #2426 together
   - Ensure consistent API design
   - Can merge incrementally after review

2. **Bug Fixes**:
   - Merge #2432, #2427, #2441, #2219 (low risk)

3. **Documentation**:
   - Rebase and merge #2518 (C docs linking)
   - Merge #2500 (revdep analysis)

### Medium Term (Next Quarter)

1. **Plan Breaking Changes Release**:
   - Bundle #2453, #2455, #2457, #2452, #2187, #2002
   - Review #758 (numeric edge IDs) - include or close
   - Coordinate with "next" branch strategy (#2421)

2. **Parameter Naming Standardization**:
   - After resolving #2458 vs #2450 conflict
   - Merge #2456, #2436

3. **Infrastructure**:
   - Review #2375 (.Call() removal)
   - Review #2431 (vctrs dependency)

### Cleanup Actions

**Close or Complete**:
- #942: 26 months old - rebase or close
- #758: 33 months old - review and decide
- #1502: 16 months old - complete deprecation or close
- #1559: 15 months old - rebase ARPACK update or close
- #1871: 7 months old - review or close
- #2439: WIP - wait for completion or close
- #2437: Automated test updates - review and merge/close

---

## Statistics

### By Type (from title prefix)
- `feat:` - 20 PRs (new features)
- `fix:` - 8 PRs (bug fixes)
- `chore:` - 11 PRs (maintenance)
- `docs:` - 2 PRs (documentation)
- `test:` - 3 PRs (tests)
- Other/WIP - 11 PRs

### By Age
- Very new (< 1 month): 3 PRs
- Recent (1-3 months): 33 PRs
- Medium (3-6 months): 8 PRs
- Old (6-12 months): 6 PRs
- Very old (12+ months): 5 PRs

### By Author
- Copilot bot: ~35 PRs
- @maelle: 2 PRs
- @krlmlr: 1 PR
- github-actions[bot]: 2 PRs
- Others: ~15 PRs

### By Status
- Draft: 50 PRs
- Non-draft: 5 PRs
- Explicitly WIP: 3 PRs
- Blocked: 2 PRs

---

## Conclusion

The repository has a large backlog of PRs, with a significant burst of activity in October 2025 focused on API standardization and exposing igraph 0.10 functions. Key priorities should be:

1. **Resolve the naming conflict** between #2458 and #2450
2. **Review and merge** #2485 (major autogeneration work)
3. **Quick wins**: Merge bug fixes (#2432, #2427, #2441, #2219) and #2515
4. **Plan breaking changes** for next major release using the "next" branch
5. **Close stale PRs** older than 12 months that aren't being actively worked on
6. **Group review** the igraph 0.10 function exposure PRs for consistency

The October 2025 PRs show good systematic work on API consistency, but need coordination to avoid conflicts and ensure a coherent design.
