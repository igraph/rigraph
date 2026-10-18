---
name: "Handbook: Update"
description: Check this handbook against its source, cynkra/handbook-tools, and refresh the pointer leaves, rule file, skills, and check script carried from it, or install them for the first time.
category: Docs
tags: [docs, handbook, maintenance]
---

Check this handbook against the source [`handbook/meta/local/`](/handbook/meta/local/README.md) names, and refresh what is carried from it.

Use the Skill tool with `skill: handbook-update`, passing the user's argument, if any, as `args`: `install`, `update`, or `check`.
The default is `check`, then `update` on a yes, then the reading that settles the source's changes here.
Never commit and never push: the user reviews and commits.
