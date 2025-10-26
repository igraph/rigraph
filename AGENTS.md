# AI Agent Development Guidelines for igraph

## Project Overview

igraph is an R package with routines for simple graphs and network analysis. It can handle large graphs very well and provides functions for generating random and regular graphs, graph visualization, centrality methods and much more.

## Install and run R

- When run on GitHub Actions, assume that R, the package in its current state and all dependencies are installed.
- Only install new packages when needed for implementing new features or tests.
- Run `R -q -e 'testthat::test_local(reporter = "check")` to execute tests as a final step.

## Code Style and Documentation

### PR and Commit Style

- PRs and commits use the conventional commit style with backticks for code references such as `function_call()` .
- PRs are generally squashed, a clean history within a PR is not necessary.

### Comment Style

- Add comprehensive comments to utility functions that aren't immediately obvious
- Use line breaks after each sentence in multi-sentence comments
- Focus comments on explaining the "why" and "how", the "what" should be clear from the code itself
- Include context about the function's role in the testing framework

### R Code Conventions

- Follow existing naming conventions (snake_case for functions, camelCase for some legacy functions)
- Use explicit package prefixes (e.g., `withr::local_db_connection()`) for clarity
- Maintain consistent indentation and spacing patterns
- Use meaningful variable names that reflect the testing context
- Run `air format .` before committing changes to ensure consistent formatting
- Keep documentation in sync with code changes. When updating roxygen2 documentation, ensure that each sentence is on its own line for better readability. Run `R -q -e 'devtools::document()'` to update the documentation.

## Code Generation

See `tools/README.md` for guidelines on code generation using the Stimulus framework.

## Build Artifacts and Generated Files

### Files Not to Commit

The following build artifacts and generated files should not be committed:

- `*.dd` files in `src/` - These are generated dependency tracking files created during build. They are already ignored via `src/.gitignore`.
- `tests/testthat/testthat-problems.rds` - Test result artifacts that change with each test run.
- `src/*.d` - Makefile dependency files.
- `src/*.o` and `src/*.so` - Compiled object files and shared libraries.

### Dependency Tracking System

The build system uses a dependency tracking mechanism implemented via `.dd` files:

- **Purpose**: Track dependencies between source files and headers to enable incremental builds
- **Generation**: Created automatically by the build system from `.d` files (see `src/deps.mk`)
- **Format**: Makefile-compatible dependency declarations listing local (non-system) headers
- **Lifecycle**: Generated during build, filtered to exclude system headers, and used by Make to determine what needs recompiling

See `src/deps.mk` for the implementation. The `.dd` files should never be committed as they contain machine-specific paths and are regenerated on each build.
