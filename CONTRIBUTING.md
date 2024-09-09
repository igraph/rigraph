# How to Contribute to the igraph R package

## TL;DR

Send your PR! Thanks!

## Slightly more Details

You want to contribute? Awesome! Small changes, like fixing typos in
documentation are completely fine and also most welcome. For bigger changes, we
suggest that you open an issue before you start coding, so that we can maximize
the probability that we can successfully merge in your code.

## R or C

This guide is for the igraph R package, but note that the package uses the
igraph C library internally for most things. If your changes involve the C
library as well, then you need to make those changes first, in the repository of
the C library: https://github.com/igraph/igraph.

## Development and Compilation

All development is being done on the default branch so that it can be
automatically installed using `remotes::install_github("igraph/rigraph")` or
`pak::pak("igraph/rigraph")`. If you have the stable version of igraph already
installed, you can avoid conflicts by installing the development version in its
own directory, e.g. `remotes::install_github("igraph/rigraph", lib =
"~/testing/")`. Then, to load the development version in an R session, use
`library(igraph, lib.loc = "~/testing/")`. Remove the development version with
`remove.packages("igraph", lib = "~/testing/")`.

You can locally build and test the `igraph` package as follows. From an R
process running in the local `./rigraph` directory, run `pkgload::load_all()` to
compile the cloned version of igraph and load it for use in the current
session. You can run the package tests with `testthat::test_local()`. If your
change includes updates to the documentation, also run `devtools::document()` to
update the package documentation. Note that you can either clone the package and
locally build it with `pkgload::load_all()` _or_ install the package from GitHub
with `remotes::install_github()`---you do not need to do both. You can keep your
local clone up to date with `git` tools, or remove it by deleting the local
`./rigraph` directory.

### Windows

When building from source on Windows, you need to have
[RTools](https://cran.r-project.org/bin/windows/Rtools/) installed.
Additionally, the two system requirements of `glpk` and `libxml2` are not
optional, but hard requirements. For version R >= 4.0 you can install these two
from an RTools terminal using

```sh
pacman -Sy mingw-w64-{i686,x86_64}-glpk mingw-w64-{i686,x86_64}-libxml2
```

To update the files stored redundantly, run

```sh
make igraph
```

. This is done automatically on CI/CD, in some cases changes are committed
directly to the branch that is being tested.

## Making Trivial Changes

- [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) the
  repository. You should have a copy of `/rigraph` under your username, at
  `https://github.com/<username>/rigraph`.
- In _your_ forked repository, look for the file you want to modify.
- Click on the edit symbol (pen) on the upper right corner of the file view.
- Make your edits.
- Write a short commit message, less than 65 characters. E.g. "Fix manual page
  typo" or "Fix degree bug for loops". If needed, elaborate your changes below
  in the "extended description" field.
- Commit your changes.
- Go back to the start page of your forked repository.
- Click on the green button before the branch name to create a pull request.
- Click on "Create pull request".
- Provide a more detailed description if you like. Please also indicate that you
  are fine with licensing your contribution under igraph's license (see Legal
  Stuff below).
- Click on "Create pull request".
- That's it! It is probably a good idea to keep your forked repository until the
  change is accepted into igraph, in case you need to modify it.
- Now you need to wait for us, unfortunately. Please ping us, if it takes long
  to respond. E.g. a week is considered to be long.
- Once your pull request is accepted, you can delete your forked repository.

## Making More Involved Changes

This is mostly the same as for trivial changes, but you probably want to edit
the sources on your computer, instead of online on GitHub. If you are unfamiliar
with cloning repositories from GitHub, the manual
[page](https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories)
for working with remote repositories is a good place to start. There is also a
more general introduction page
[here](https://docs.github.com/en/get-started/quickstart), which includes
information on setting up
[`git`](https://docs.github.com/en/get-started/quickstart/set-up-git). The `git`
manual is [here](https://www.git-scm.com/docs). R development environments may
also include support for `git`/GitHub integration (for an introduction to the
RStudio tools, see this
[tutorial](https://geo.uzh.ch/microsite/reproducible_research/post/rr-rstudio-git/);
Emacs/ESS users can use [Magit](https://magit.vc/)).

- Open an issue in the issue tracker about the proposed changes. This is not
  required for smaller things, but we suggest you do it for others. Just in case
  somebody is already working on the same thing, or it is something we don't
  want in igraph.
- Fork and clone the repository. If you have already forked the repository,
  synch your forked copy to get the latest version of the `main` branch, then
  fetch the updated `main` to your local clone.
- Make changes to the appropriate files in the local clone.
- Once ready with your changes, build igraph and run the tests as indicated
  above.
- Commit your changes to a new branch. Give the branch a descriptive name that
  is specific to the changes you want to make. Then, push those changes to your
  forked copy of igraph on GitHub.
- Submit your pull request to the main branch. You should see text similar to
  "`<username>` wants to merge 1 commit into `igraph:main` from
  `<username>:fix-some-func`". If your pull request relates directly to an issue
  (e.g., if you opened an issue to discuss the proposed changes), include the
  keyword "fix" and the issue number (e.g., "Fix #123) on its own line in your
  initial comment for the pull request. This step supports better issue
  tracking; for a list of keywords, see
  [here](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword).
- Now you need to wait for us, unfortunately. Please ping us, if it takes long
  to respond. E.g. a week is considered to be long.

## Writing igraph Code

Some tips on writing igraph code. In general, look at how things are done, and
try to do them similarly. (Unless you think they are not done well, in which
case please tell us.)

### Code Formatting

We follow the [tidyverse style guide](https://style.tidyverse.org/) for
formatting. The [styler package](https://styler.r-lib.org/) helps apply this
style to the code (see also the [lintr package](https://lintr.r-lib.org/)).
Look at the style (indentation, braces, etc.) of some recently committed bigger
change, and try to mimic that.

### Documentation

- Install roxygen2 but also [igraph.r2cdocs](https://github.com/igraph/igraph.r2cdocs).

```r
install.packages("roxygen2")
pak::pak("igraph/igraph.r2cdocs")
```

- Please document your new functions using
[roxygen2](https://roxygen2.r-lib.org/), and run `devtools::document()` or `make
igraph` to update the `.Rd` files.

### Test Cases

Unless you change something trivial, please consider adding test cases.  This is
important! See the files in the `./rigraph/tests/testthat` directory for
examples. See the r-utils package [testthat](https://testthat.r-lib.org/) for
some unit testing support functions.

### Ask Us!

In general, if you are not sure about something, please ask! You can open an
issue on Github, write to the igraph-help mailing list (see the homepage at
http://igraph.org), or write to Tamás and Gábor. We prefer the public forums,
though, because then others can learn from it, too.

## Legal Stuff

This is a pain to deal with, but we can't avoid it, unfortunately. So, igraph is
licensed under the "General Public License (GPL) version 2, or later". The
igraph manual is licensed under the "GNU Free Documentation License". If your
contribution is bigger than a typo fix, then please indicate that you are fine
with releasing your code/text under these licenses. E.g. adding a sentence that
reads as "I'm fine with GPL 2 or later and FDL." is perfectly enough.
