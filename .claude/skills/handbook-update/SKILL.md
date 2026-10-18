---
name: handbook-update
description: Check this repository's handbook against its source, cynkra/handbook-tools, refresh the pointer leaves and the carried tooling, and stamp the marker; or install them for the first time. Use when the user asks to update, adopt, or check the handbook conventions, the docs-consistency skill, or the prose rule file, when `.handbook-source` carries a `source-date` older than the source's newest commit, or when a page here is found to disagree with a shared page.
license: MIT
compatibility: Requires git and a POSIX shell, and a checkout of the source repository or the means to obtain one.
---

# Handbook update

*Serves [`handbook/meta/local/`](/handbook/meta/local/README.md), the page that says what this repository decides beyond the shared rules,
and the adoption leaf in the source it names,
[`handbook/adoption/`](https://github.com/cynkra/handbook-tools/blob/main/handbook/adoption/README.md),
which owns the classes of carried file, the marker, and the four verbs.*

The shared pages live in the source, and the pages here at their paths point there;
the rule file, the skills, and the check script are carried here unchanged by a script in the source.
This skill runs that script from a session, then does what the script cannot:
it reads what the source changed since this handbook was last checked against it, and settles each change here,
so that the marker's new date means the whole handbook was checked, not that files were copied.
It never edits a pointer leaf or a carried file by hand: a wanted change is made in the source and arrives here at the next update.

## Preflight

1. **Read the marker.**
   `.handbook-source` at the root names the source repository, its URL, the commit and the date of the source state
   this handbook was last checked against (`commit`, `source-date`), the day of that check (`checked`), and the files carried.
   Absent, this repository has not adopted the system yet; say so and continue with `install` only if the user asks for it,
   and with the `handbook-adopt` skill from the source if a handbook already exists here.
2. **Obtain the source, as `SOURCE` below.**
   Prefer an existing checkout: `$HANDBOOK_TOOLS` when set, else a sibling directory named `handbook-tools`.
   Otherwise clone the URL from the marker into a temporary directory, at its default branch.
   In a Claude Code web session that cannot reach the repository, attach it first with the session's repository tool, then clone.
3. **Refuse a dirty carried file.**
   `git status --porcelain` on the files the marker lists must be empty;
   an uncommitted edit to a carried file would be overwritten silently, so stash it or stop.

## Run

```sh
"$SOURCE/scripts/vendor.sh" --source "$SOURCE" --target . check
```

`DRIFT` is a carried file edited here, `UPDATE` one the source has changed since the marker's commit,
`BEHIND` the marker's `source-date` being older than the source's, `MISSING` a file or the marker not carried,
and a `NOTE` says the marker's commit is gone from the source, in which case a `DRIFT` may be an update instead.
A `DRIFT` the user wants to keep is a change for the source:

```sh
"$SOURCE/scripts/vendor.sh" --source "$SOURCE" --target . diff
```

prints it as a patch that applies in a source checkout, and the copy here is then refreshed rather than kept edited.
Then, with the user's yes:

```sh
"$SOURCE/scripts/vendor.sh" --source "$SOURCE" --target . update    # or install, the first time
```

Show `git diff --stat`.

## Check the handbook against the source

The source is a moving target and the pages here already point at its latest state;
this step is what makes the marker's date true.
List the source's commits since the marker's `source-date` that touched `handbook/meta/` or the carried files:

```sh
git -C "$SOURCE" log --since="$OLD_SOURCE_DATE" --format='%cs %h %s' -- handbook/meta .claude
```

For each, read the change and settle what it means here, then say what you did in the wrap-up:

* **A shared page now settles a choice the local page answered.**
  Delete the local answer; the shared text says it.
* **A shared page now leaves a choice open, or adds one.**
  Answer it on [`handbook/meta/local/`](/handbook/meta/local/README.md), under the run-in heading that fits.
* **A rule changed, and a page here restates or contradicts the old one.**
  Fix the page; a page that merely linked the shared page needs nothing.
* **A shared page's scope sentence changed.**
  The update carried the pointer leaf's new scope with it; check that the `meta/` index line still describes it.
* **The check script gained or renamed a finding.**
  Run `/docs:check` and settle what fires.
* **A carried skill or the rule file changed.**
  Read the diff for what it now asks of a session here, and check the ignore file's exemptions still cover what they should.

## Wrap-up

* The old and the new `source-date` from the marker, and the commit each names.
* Files carried, stubs still absent, and each source change settled here, in one line each.
* Whether this repository mirrors skills into `.github/`, and the reminder that the mirror is copied by hand after an update.
* Never commit and never push: the user reviews and commits.
