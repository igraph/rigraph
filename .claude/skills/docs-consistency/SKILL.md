---
name: docs-consistency
description: Check that the documentation system is whole. Handbook pages in the right shape, links that resolve, derived documents newer than their sources, a backreference on every document outside the handbook, and the judgment those checks cannot make. Use when a change touches documentation of any kind (a handbook page, `AGENTS.md`, `CLAUDE.md`, `README.md`, a skill or command file, a derived document), and periodically as a sweep.
license: MIT
compatibility: Requires git and a POSIX shell. The script beside this file uses only git, awk, sed, and grep.
---

# Documentation consistency

*The enforcement arm of the handbook rules ([`handbook/meta/handbook/`](/handbook/meta/handbook/README.md)):
the checks that keep the documentation system whole.*

This skill is the entry point.
The mechanical half is one script beside it, and the judgment is the reading around the script's findings.
Run the script first, from anywhere inside the repository, and spend the reading time on what it cannot see.

## The mechanical half

```sh
.claude/skills/docs-consistency/scripts/check-handbook.sh
```

Every finding is one line: a tag, a path, and what is wrong, and the script exits non-zero when it printed any.
What each tag means is [`handbook/checks/`](https://github.com/cynkra/handbook-tools/blob/main/handbook/checks/README.md)'s where this skill lives in its source repository;
in a repository that carries it, the tag names the rule and the path names the file, which is enough to act on.
The em dash check is on by default; [`handbook/meta/local/`](/handbook/meta/local/README.md) says whether this repository keeps it,
and `.handbook-ignore` is where it is dropped, by path or altogether.
Two reports print only when named, and both feed the judgment below:

```sh
.claude/skills/docs-consistency/scripts/check-handbook.sh board   # status, verification date, depth per page
.claude/skills/docs-consistency/scripts/check-handbook.sh lines   # every deepen line, with its page
```

Exemptions are the repository's:
`.handbook-ignore` at the root skips a generated or foreign file in every check, or in the orphan or em dash check alone,
with the reason beside the pattern.

## The judgment

1. **Tree shape.**
   The script proves every directory has a page and every child is listed.
   It cannot tell whether a scope sentence still admits its children,
   whether a principle on a node passes the three tests in [`handbook/meta/forms/`](/handbook/meta/forms/README.md),
   or whether a node has started explaining.
   Hold `ls -d handbook/*/*/` beside the root's child list, whose entries sketch each area's next level in prose,
   to see a child the sketch skipped, since it reads fluently either way.

2. **Coverage.**
   Every part of the repository a reader could have a question about is claimed by exactly one leaf.
   Walk the top-level directories and the root files against the leaves' scope sentences and deepen lines.
   Unclaimed surface is a finding, reported with a proposed leaf address:
   a homeless topic raises no error, so full cover is a claim to audit, not one the tree's shape can enforce.
   Where a topic seems homeless, ask first whether a node's *wording* excluded it rather than its design.

3. **Backreferences.**
   The script reports a document with neither `derived_from:` nor a link into the tree.
   It cannot tell whether the node a document points at is the one it serves:
   a pointer at the root, or at an internal node whose leaf owns the fact, answers nothing.
   Nor can it tell whether a document that merely points should be derived, because it has started restating what a leaf holds.
   Any secondary document touched by the change under review carries its backreference; add it or flag it.
   A script or a configuration carries one too, in a comment, and which file is a document is this skill's call rather than a pattern's.

4. **Entries.**
   An entry restating what the experiment, issue, or proposal it links already holds is a second copy of a record
   ([`handbook/meta/authoring/`](/handbook/meta/authoring/README.md) says how long an entry is).
   A leaf past 120 lines owes an answer to why it is still one topic.

5. **Deepen lines.**
   Their promises must still be redeemable.
   Check each issue a *drain* clause names against the tracker with whatever GitHub access the session has,
   since a closed issue is drained or dropped and never left promised,
   and each section a line names against the headings of the file it would absorb.

6. **External links.**
   The script skips them.
   Check the repository's own issue and pull-request links with whatever GitHub access the session has,
   and treat an unreachable foreign domain as unverified rather than broken:
   in a sandboxed session the proxy answers for anything off the allow-list, which says nothing about the link.

7. **Headers.**
   Where an in-place index is generated from file headers, whether a header says what its file does is judged here,
   and a weak one is fixed at the source file rather than patched in the index.

8. **Status.**
   A `draft` page that has since been verified is flipped to `confirmed` with a `verified:` date.
   A stale `verified:` date on a page whose facts have moved is worse than none.

## Report and repair

Apply the small fixes in the same change:
a broken or upward link, a child list out of step with its directory, a missing backreference,
a missing or misplaced deepen line, a stale derivation.
Report the structural findings instead of acting on them:
unclaimed surface, an internal node accreting prose, a leaf outgrowing its scope, a page restating what the leaf it links already says.
One summary at the end, no per-file chatter.

Derivation runs one way: a wrong derived document is fixed at its handbook source and re-derived, never patched in place.
The rules define, this skill enforces:
when the two disagree, [`handbook/meta/handbook/`](/handbook/meta/handbook/README.md) is the authority, and the fix lands there first.
