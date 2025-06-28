# Claude Development Guidelines for igraph

## Project Overview

igraph is an R package with routines for simple graphs and network analysis. It can handle large graphs very well and provides functions for generating random and regular graphs, graph visualization, centrality methods and much more.

## Code Style and Documentation

### Comment Style

- Add comprehensive comments to utility functions that aren't immediately obvious
- Use line breaks after each sentence in multi-sentence comments
- Focus comments on explaining the "why" and "how", the "what" should be clear from the code itself
- Include context about the function's role in the testing framework

### R Code Conventions

- Follow existing naming conventions (snake_case for functions, camelCase for some legacy functions)
- Use explicit package prefixes (e.g., `withr::local_db_connection`) for clarity
- Maintain consistent indentation and spacing patterns
- Use meaningful variable names that reflect the testing context

## Install and run R

Never check if rig or R are installed on GitHub Actions, they are not.
Use rig to install R.
Install rig with:

```bash
curl -Ls https://github.com/r-lib/rig/releases/download/latest/rig-linux-$(arch)-latest.tar.gz |
  sudo tar xz -C /usr/local
```

Then install the current release version of R:

```bash
rig add release
```

Run R code with:

```bash
Rscript -e '<expression>'
```

Use pak to install packages, it will be installed by rig:

```R
pak::pak("<package>")
```
