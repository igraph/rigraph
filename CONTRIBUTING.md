# How to Contribute to the igraph R package

## TL;DR

Send your PR! Thanks!

## Slightly more Details

You want to contribute? Awesome! Small changes, like fixing typos in
documentation are completely fine and also most welcome. For bigger
changes, we suggest that you open an issue before you start coding, so that
we can maximize the probability that we can successfully merge in your
code.

## R or C

This guide is for the igraph R package, but note that the package uses the
igraph C library internally for most things. If your changes involve the C
library as well, then you need to make those changes first, in the repository
of the C library: https://github.com/igraph/igraph.

## Development and Compilation

All development is being done on the default branch, so that it can be
automatically installed using `remotes::install_github("igraph/rigraph")`
or `pak::pak("igraph/rigraph")` . Some parts of the code (sources for the
C library, `.Rd` documentation files, ...) are stored redundantly
and updated by running `make` or `make igraph`.

If you clone the repository, you can locally build and test the `igraph`
package using the `testthat` package as follows:

```R
testthat::test_local()
```

When building from source on Windows, you need to have
[RTools](https://cran.r-project.org/bin/windows/Rtools/) installed.
Additionally, the two system requirements of `glpk` and `libxml2` are
not optional, but hard requirements. For version R >= 4.0 you can install these
two from an RTools terminal using

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

- Then look for the file you want to modify.
- Click on the edit symbol (pen) on the upper right corner of the file
  view.
- Make your edits.
- Write a short commit message, less than 65 characters. E.g. "Fix manual
  page typo" or "Fix degree bug for loops". If needed, elaborate your
  changes below in the "extended description" field.
- Commit your changes.
- Go back to the start page of _your_ forked repository. It is at
  `https://github.com/<username>/rigraph`.
- Click on the green button before the branch name to create a pull
  request.
- Click on "Create pull request".
- Provide a more detailed description if you like. Please also indicate
  that you are fine with licensing your contribution under igraph's license
  (see Legal Stuff below).
- Click on "Create pull request".
- That's it! It is probably a good idea to keep your forked repository
  until the change is accepted into igraph, in case you need to modify it.
- Now you need to wait for us, unfortunately. Please ping us, if it takes
  long to respond. E.g. a week is considered to be long.
- Once your pull request is accepted, you can delete your forked repository.

## Making More Involved Changes

This is mostly the same as for trivial changes, but you probably want to
edit the sources on your computer, instead of online on GitHub.

- Open an issue in the issue tracker about the proposed changes. This is
  not required for smaller things, but I suggest you do it for others. Just
  in case somebody is already working on the same thing, or it is something
  we don't want in igraph.
- Fork the repository, and clone it to the machine you'll work on.
- Make sure you work on the `dev` branch, or alternatively, create a new branch
  based on the `dev` branch.
- Once ready with your changes, build igraph, and run the tests as indicated above.
- Submit your pull request.
- Now you need to wait for us, unfortunately. Please ping us, if it takes
  long to respond. E.g. a week is considered to be long.

## Writing igraph Code

Some tips on writing igraph code. In general, look at how things are done,
and try to do them similarly. (Unless you think they are not done well, in
which case please tell us.)

### Code Formatting

We follow the [tidyverse style guide](https://style.tidyverse.org/) for
formatting. The styler package helps apply this style to the code.
Look at the style (indentation, braces, etc.) of some recently committed
bigger change, and try to mimic that.

### Documentation

Please document your new functions using `roxygen2`, and run `devtools::document()`
or `make igraph` to update the `.Rd` files.

### Test Cases

Unless you change something trivial, please consider adding test cases.
This is important! See the files in the `inst/tests` directory for
examples.

### Ask Us!

In general, if you are not sure about something, please ask! You can
open an issue on Github, write to the igraph-help mailing list (see the
homepage at http://igraph.org), or write to Tamás and Gábor. We prefer
the public forums, though, because then others can learn from it, too.

## Legal Stuff

This is a pain to deal with, but we can't avoid it, unfortunately. So,
igraph is licensed under the "General Public License (GPL) version 2, or
later". The igraph manual is licensed under the "GNU Free Documentation
License". If your contribution is bigger than a typo fix, then please
indicate that you are fine with releasing your code/text under these
licenses. E.g. adding a sentence that reads as "I'm fine with GPL 2 or
later and FDL." is perfectly enough.
