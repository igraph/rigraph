# What this repository decides

The choices the shared rules ([`meta/handbook/`](/handbook/meta/handbook/README.md)) leave open, answered for this repository,
and the rules it adopts beyond the shared ones.
This is the one page under `meta/` that answers for this repository;
the shared pages beside it point to their home, [`cynkra/handbook-tools`](https://github.com/cynkra/handbook-tools),
and [`.handbook-source`](/.handbook-source) names the state of the source this handbook was last checked against.

<!-- Answer each heading in a sentence or two, linking the leaf or file that owns the detail.
     Delete a heading only where the answer is "nothing", and say so instead. -->

**Intent and status.**
<!-- Where a design for work not done lives (a plan directory, openspec/changes/, the issue tracker),
     where status lives, and the leaf that owns the conventions of each. -->

**Evidence.**
<!-- experiments/ in the shared shape, or the directory that stands in for it, and its registry. -->

**What this repository does not author.**
<!-- Generated files and their generators, vendored trees, third-party copies; the same paths go into .handbook-ignore
     where the checks should skip them, with the reason beside the pattern. -->

**The comment budget.**
<!-- The formatter and the line width a comment aims for, per language. -->

**Who the text may name.**
<!-- Whether authored text, commit messages, and review comments may carry personal names,
     and the leaf that owns the role vocabulary where they may not. -->

**The language of the prose and of the domain.**
<!-- Which language the prose takes, which language domain terms keep where the two differ,
     and which orthographic variety of each. -->

**Rules adopted beyond the shared ones.**

* **No em dashes**, in prose and code alike.
  A comma, a colon, a semicolon, or a parenthesis says the same thing.
  The check reports one in any tracked file, and a commit message is review's to read.
<!-- Keep, or delete, the rule above; a repository that permits em dashes says so in .handbook-ignore, with the
     reason. Add other rules, each linking the leaf that owns it where one exists. -->

**Documents shipped without the tree.**
<!-- A package README rendered from a tarball, reference pages, a site: where their pointer to the tree lives instead. -->

**Enforcement.**
<!-- What runs the check script here, and what checks the carried tooling against the source:
     the CI workflow stub does both, else a hook, else review alone. -->
