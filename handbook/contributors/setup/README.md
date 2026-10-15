# Setup

A working development environment.

1. Install the dependencies with `pak::pak()`, and the build dependencies with `pak::pak(dependencies = "Config/Needs/build")`.
2. Load the package for development with `pkgload::load_all()`, or build it from source ([`build/source-build/`](/handbook/build/source-build/README.md)).
3. Run the suite ([`testing/suite/`](/handbook/testing/suite/README.md)), and `devtools::check()` before a change is done.

Only install new packages when a feature or a test needs them.
On GitHub Actions, R, the package and its dependencies are installed already.

*To deepen: absorb `CONTRIBUTING.md` § Development and Compilation.*
