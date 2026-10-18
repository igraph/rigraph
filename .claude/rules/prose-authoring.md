---
paths:
  - "**/*.md"
  - "**/*.Rmd"
  - "**/*.qmd"
  - "**/*.yaml"
  - "**/*.yml"
---

<!--
derived_from:
  - handbook/meta/authoring/README.md
  - handbook/meta/style/README.md
  - handbook/meta/handbook/README.md
  - handbook/meta/forms/README.md

The declaration sits here rather than in the front matter above, which belongs
to Claude Code: only `paths` is documented there, and a shared file should not
rest on how an unknown key happens to be treated. The checks read it from
either place.
-->

# Writing prose in this repository

_Derived from [`handbook/meta/authoring/`](/handbook/meta/authoring/README.md) and [`handbook/meta/style/`](/handbook/meta/style/README.md),
which own the prose rules,
and [`handbook/meta/handbook/`](/handbook/meta/handbook/README.md) and [`handbook/meta/forms/`](/handbook/meta/forms/README.md),
which own the tree's.
Those pages are the authority,
and [`handbook/meta/local/`](/handbook/meta/local/README.md) is what this repository decides beyond them.
All of them are shared pages whose home is `cynkra/handbook-tools`, and this file is carried from there unchanged.
This is the short form, and it loads when you touch a file that carries prose.
Fix the leaf first and re-derive this, never the other way around._

## Before writing a sentence

Walk these in order and stop at the first that answers.

1. Is it a fact about how things work today? Intent belongs where the local page says intent lives; history belongs to git and the logs.
2. Is it true? Verify against the thing itself before writing, not after review.
3. Does another handbook leaf, a file header, or a reference page own it? Link it, never restate or paraphrase it.
4. Does an artifact already state it? Never re-enumerate what a file lists; state the principle that locates it.
5. Could a check state it instead? A trap that keeps happening deserves a guard, not a paragraph asking readers to remember.
   A measurement too expensive to re-derive becomes an experiment record, linked from the leaf that leans on it.
6. Then write it, as short as it can be and stay correct, and leave a breadcrumb where the reader stands.

A behaviour that looks wrong rather than chosen is settled before the ladder:
a small fix beats a paragraph, and a real limitation is stated with the issue that will remove it.

## Writing the sentence

- Semantic line breaks: break at meaning boundaries, never mid-phrase, never a one-word line,
  never a line starting with one word and a comma.
- Aim for 140 characters, and let meaning win where it will not fit.
- A line ends with a full stop unless it is a heading, a bold run-in, a list item name, or a colon introducing a list.
- Default to a bullet list; make a table earn its columns.
- Name the mechanism rather than the count, treat a default as a fact by naming the value and where it is set,
  and never refer to anything by position.
- A comment says what the line does and names the leaf that says why;
  it takes the code's line budget, and every rule here holds inside it.
- Link a provisional fact to the issue or proposal that will change it, as a full link.
- Cite the claim, not its label: a number from another page's table means nothing where it is read.
- The rules this repository adopts beyond these, an em dash ban among the usual ones, are on the local page.

## Where the file lives in the tree

- A fact belongs on exactly one handbook leaf.
  If you are about to write a durable fact into a document outside `handbook/`, that is the signal to put it on a leaf and link it instead.
- Every document outside `handbook/` either declares its handbook sources in a `derived_from:` list
  or carries a visible backreference to the node it serves.
  The list sits in front matter, or in an HTML comment where the front matter belongs to another tool, as an issue template's does.
  A document with neither is an orphan.
- Editing a document that declares `derived_from:` means editing its sources first, then re-deriving.
- Link a boundary once per page, and link the leaf that owns the fact rather than the node above it.
- Never number a living page; only an append-only artifact takes a number or a date in its name.
- Run `/docs:check` before you finish, and work the skill's judgment checks too when the change is substantial.

## Where these rules stop

A GitHub issue or pull request body takes reflowed paragraphs, because a single newline renders there as a visible break.
Structure is not prose: a YAML key, a path, and a command are what they are, and only the sentences around them follow these rules.
Generated files and anything vendored from a third party are nobody's to reformat: fix the generator or leave it alone.
