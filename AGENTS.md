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
