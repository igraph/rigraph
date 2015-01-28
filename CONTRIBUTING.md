
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
library as well, then you need make those changes first, in the repository
of the C library: https://github.com/igraph/igraph.

## Making Trivial Changes

* Please always use the `dev` branch. Choose this branch in your fork. (We
  build the `master` branch from the `dev` branch automatically, to make
  sure that the repo is compatible with the `devtools` R package which uses
  the `master` branch by default.)
* Then look for the file you want to modify.
* Clique on the edit symbol (pen) on the upper right corner of the file
  view.
* Make your edits.
* Write a short commit message, less than 65 characters. E.g.  "Fix manual
  page typo" or "Fix degree bug for loops". If needed, elaborate your
  changes below in the "extended description" field.
* Commit your changes.
* Go back to the start page of *your* forked repository. It is at
  `https://github.com/<username>/rigraph`.
* Click on the green button before the branch name to create a pull
  request.
* Click on "Create pull request".
* Provide a more detailed description if you like. Please also indicate
  that you are fine with licensing your contribution under igraph's license
  (see Legal Stuff below).
* Click on "Create pull request".
* That's it! It is probably a good idea to keep your forked repository
  until the change is accepted into igraph, in case you need to modify it.
* Now you need to wait for us, unfortunately. Please ping us, if it takes
  long to respond. E.g. a week is considered to be long.
* Once your pull request is accepted, you can delete your forked repository.

## Making More Involved Changes

This is mostly the same as for trivial changes, but you probably want to
edit the sources on your computer, instead of online on Github.

* Open an issue in the issue tracker about the proposed changes.  This is
  not required for smaller things, but I suggest you do it for others. Just
  in case somebody is already working on the same thing, or it is something
  we don't want in igraph.
* Fork the repository, and clone it to the machine you'll work on.
* We usually build igraph on OSX, so the `dev` branch is usally fine on
  that platform. It might have problems on other systems. If this happens,
  please open an issue and tell us.
* Make sure you work on the `dev` branch.
* Once ready with your changes, build igraph, and run the tests. If you use
  the `devtools` package, this (assuming you are in the right directory)
  means running:

  ```R
  system("git module init")
  system("git module update")
  system("make")
  library(devtools)
  install()
  build()
  test()
  ```

* Submit your pull request.
* Now you need to wait for us, unfortunately. Please ping us, if it takes
  long to respond. E.g. a week is considered to be long.

## Writing igraph Code 

Some tips on writing igraph code. In general, look at how things are done,
and try to do them similarly. (Unless you think they are not done well, in
which case please tell us.)

### Code Formatting

Look at the style (indentation, braces, etc.) of some recently committed
bigger change, and try to mimic that. The code style within igraph is not
stricly the same, but we want to keep it reasonably similar.

### Documentation

Please document your new functions using `roxygen`.

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

This is a pain to deal with, but we can't avoid it, unfortunately.  So,
igraph is licensed under the "General Public License (GPL) version 2, or
later". The igraph manual is licensed under the "GNU Free Documentation
License".  If your contribution is bigger than a typo fix, then please
indicate that you are fine with releasing your code/text under these
licenses.  E.g. adding a sentence that reads as "I'm fine with GPL 2 or
later and FDL."  is perfectly enough.
