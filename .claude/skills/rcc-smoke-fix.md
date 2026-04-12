Scheduled job: scan all `*-dev` branches (including `broken-*-dev`) in
`krlmlr/rigraph` for the earliest commit whose `rcc` commit-status (set by the
"Smoke test: stock R" job in the `rcc` workflow) is `failure` since 2026-04-11.
For each such branch, if no `broken-<branch>-<sha7>` branch exists yet, create
it, fix `testthat::test_local()` and `R CMD check .`, update snapshots, then
cherry-pick all later vendor commits from the `*-dev` branch and push.
Never modify vendored files (`src/vendor/`, `patch/`).

---

## Step 1 — Refresh local mirror of krlmlr/rigraph (always, force-reset)

```bash
if ! git remote get-url krlmlr &>/dev/null 2>&1; then
  git remote add krlmlr https://github.com/krlmlr/rigraph.git
fi
# Hard-reset: throw away any cached remote-tracking state
git fetch krlmlr --force --prune --tags
```

## Step 2 — Collect all branches and existing broken-* branches in one pass

```bash
# All krlmlr remote-tracking branches that end in -dev
DEV_BRANCHES=$(git branch -r \
  | grep -oP 'krlmlr/\K\S+' \
  | grep -E '\-dev$' \
  | sort)

# All broken-* branches already on krlmlr (to skip re-doing work)
BROKEN_BRANCHES=$(git branch -r \
  | grep -oP 'krlmlr/\K\S+' \
  | grep -E '^broken-')

echo "=== Dev branches ===" && echo "$DEV_BRANCHES"
echo "=== Broken branches (existing) ===" && echo "$BROKEN_BRANCHES"
```

## Step 3 — For each *-dev branch, find the earliest failing commit

Iterate over every entry in `$DEV_BRANCHES`. For each `$BRANCH`:

```bash
SINCE="2026-04-11"
REPO="krlmlr/rigraph"

# Commits on this branch since SINCE, oldest-first (first-parent only)
COMMITS_OLDEST_FIRST=$(git log "krlmlr/$BRANCH" \
  --first-parent --since="$SINCE" --format="%H" --reverse)

FIRST_FAIL=""
while IFS= read -r SHA; do
  SHORT="${SHA:0:7}"
  FIX_NAME="broken-${BRANCH}-${SHORT}"

  # Skip if fix branch already exists
  if echo "$BROKEN_BRANCHES" | grep -qxF "$FIX_NAME"; then
    # This exact failure is already handled — nothing more to do for this branch
    break
  fi

  # Check the rcc commit-status for this SHA (context = "rcc")
  STATUS=$(gh api "repos/$REPO/commits/$SHA/statuses" \
    | jq -r '[.[] | select(.context == "rcc")] | first | .state // "none"')

  echo "$BRANCH  $SHORT  $STATUS"

  if [[ "$STATUS" == "failure" ]]; then
    FIRST_FAIL="$SHA"
    break
  fi
done <<< "$COMMITS_OLDEST_FIRST"

if [[ -z "$FIRST_FAIL" ]]; then
  echo "$BRANCH: no unhandled rcc failure — skip"
else
  echo "NEEDS_FIX  $BRANCH  $FIRST_FAIL"
fi
```

Collect all `NEEDS_FIX  <branch>  <sha>` lines. Process them in order.

## Step 4 — Create, fix, and push a broken-* branch

Repeat for each `NEEDS_FIX` pair `($BRANCH, $SHA)`:

### 4a. Check out the failing commit on the new fix branch

```bash
SHORT="${SHA:0:7}"
FIX_BRANCH="broken-${BRANCH}-${SHORT}"
git checkout -B "$FIX_BRANCH" "$SHA"
```

### 4b. Install and run tests; collect failures

```bash
_R_SHLIB_STRIP_=true R CMD INSTALL . --no-byte-compile 2>&1 | tail -5
Rscript -e 'testthat::test_local(stop_on_failure = FALSE)' 2>&1
```

Read the output carefully.

### 4c. Fix issues — allowed modifications

**You may only change files outside `src/vendor/` and `patch/`.** Typical fixes:

| Symptom | Fix |
|---------|-----|
| Snapshot mismatch | `Rscript -e 'testthat::snapshot_accept()'` then inspect diffs |
| Snapshot mismatch (specific test) | `Rscript -e 'testthat::snapshot_accept("test-name")'` |
| Logical test failure | Read failing test in `tests/testthat/test-*.R`; fix R code in `R/` |
| Missing export / namespace | `Rscript -e 'roxygen2::roxygenize()'` |
| NOTE / WARNING in R CMD check | Fix in `R/` or `man/` — never in `src/vendor/` |

After any change, re-run:

```bash
Rscript -e 'testthat::test_local(stop_on_failure = FALSE)' 2>&1
```

Iterate until all tests pass.

### 4d. Final check

```bash
R CMD check . --no-manual --as-cran 2>&1 | tail -20
```

Must show `Status: OK` or at most `1 NOTE` (pre-existing CRAN notes are fine).
Fail if there are ERRORs or new WARNINGs.

### 4e. Commit the fix

```bash
git add R/ tests/ man/ NAMESPACE DESCRIPTION
# Only if there are staged changes:
git diff --cached --quiet || \
  git commit -m "fix: R code and snapshots for failing rcc at ${SHORT}"
```

### 4f. Cherry-pick all remaining vendor commits from *-dev

These commits only touch `src/vendor/` and are guaranteed to apply cleanly.

```bash
# Commits on the *-dev branch that come *after* the failing commit
REMAINING=$(git log "${SHA}..krlmlr/${BRANCH}" \
  --first-parent --format="%H" --reverse)

for C in $REMAINING; do
  git cherry-pick "$C" --allow-empty
done
```

If a cherry-pick conflict occurs on a **non-vendored** file, stop immediately
and report the conflict — it is unexpected.

### 4g. Push the fix branch

```bash
git push krlmlr "$FIX_BRANCH" --force-with-lease
```

## Step 5 — Continue

Return to Step 3 / Step 4 for the next `NEEDS_FIX` entry.
When all are processed, report a summary:

```
Fixed: broken-main-dev-abc1234 (cherry-picked N commits)
Fixed: broken-other-dev-def5678 (cherry-picked M commits)
Skipped (already fixed): ...
No failure found: ...
```

---

## Constraints (hard rules)

- **Never** modify `src/vendor/cigraph/`, `patch/`, `src/vendor/igraph_version.h`,
  or any `scripts/vendor*.sh` file.
- **Never** amend commits that have already been pushed.
- **Commit status to check**: context `rcc` (not the full check-run name).
- **Branch target**: all pushes go to the `krlmlr` remote (`krlmlr/rigraph`).
- Branches being force-pushed to: always use the freshly-fetched `krlmlr/*`
  ref; never rely on any previously-checked-out state.
