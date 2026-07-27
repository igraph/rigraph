#!/bin/bash
# Script to notify package maintainers about reverse dependency issues.
# For packages hosted on GitHub: creates a GitHub issue via the `gh` CLI.
# For packages not on GitHub: creates an email draft with pre-filled To/Cc fields.
#
# Issues are opened on behalf of the currently authenticated `gh` user.
# All filed issue URLs are recorded in notifications/issue-log.txt.

set -e

IGRAPH_CC_EMAIL="igraph-help@igraph.discourse.group"

# Check if gh CLI is available
if ! command -v gh &> /dev/null; then
    echo "Warning: gh CLI not found. Will only create email drafts."
    GH_AVAILABLE=0
else
    GH_AVAILABLE=1
fi

# Function to check if a GitHub repo exists and is accessible.
# Prints "owner/repo" on success; returns non-zero on failure.
check_github_repo() {
    local repo=$1
    if [ $GH_AVAILABLE -eq 0 ]; then
        return 1
    fi

    # Extract owner/repo from URL
    local owner_repo
    owner_repo=$(echo "$repo" | sed 's|https://github.com/||' | sed 's|\.git$||')

    if gh repo view "$owner_repo" &> /dev/null; then
        echo "$owner_repo"
        return 0
    else
        return 1
    fi
}

# Create a GitHub issue and log the resulting URL.
create_github_issue() {
    local package=$1
    local owner_repo=$2
    local title=$3
    local body=$4

    echo "  Creating GitHub issue..."

    local temp_file
    temp_file=$(mktemp)
    echo "$body" > "$temp_file"

    local issue_url
    if issue_url=$(gh issue create \
        --repo "$owner_repo" \
        --title "$title" \
        --body-file "$temp_file" \
        --label "bug" 2>/dev/null); then
        echo "  ✓ Issue created: $issue_url"
        echo "$package: $issue_url" >> "$OUTPUT_DIR/issue-log.txt"
    else
        echo "  ⚠ Failed to create issue (check authentication / permissions)"
    fi

    rm -f "$temp_file"
}

# Create an email draft with To/Cc pre-filled from CRAN metadata.
create_email_draft() {
    local package=$1
    local maintainer_email=$2
    local subject=$3
    local body=$4
    local email_file=$5

    echo "  Creating email draft..."

    cat > "$email_file" << EOF
To: $maintainer_email
Cc: $IGRAPH_CC_EMAIL
Subject: $subject

Dear $package maintainer,

$body

Best regards,
The igraph Development Team
EOF

    echo "  ✓ Email draft saved to: $email_file"
}

# High-level helper: determine the right notification channel and call it.
notify_package() {
    local package=$1
    local github_url=$2
    local maintainer_email=$3
    local issue_title=$4
    local issue_body=$5
    local email_subject=$6

    echo "Package: $package"
    local owner_repo
    if owner_repo=$(check_github_repo "$github_url"); then
        echo "  ✓ GitHub repository accessible: $owner_repo"
        create_github_issue "$package" "$owner_repo" "$issue_title" "$issue_body"
    else
        echo "  ✗ GitHub repository not accessible"
        create_email_draft "$package" "$maintainer_email" "$email_subject" "$issue_body" \
            "$OUTPUT_DIR/${package}-email.txt"
    fi
    echo ""
}

# Directory for output files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/notifications"
mkdir -p "$OUTPUT_DIR"

echo "=== Notifying Package Maintainers about Reverse Dependency Issues ==="
echo ""

# --------------------------------------------------------------------------
# Cascade
# --------------------------------------------------------------------------
notify_package \
    "Cascade" \
    "https://github.com/fbertran/Cascade" \
    "frederic.bertrand@lecnam.net" \
    "Namespace collision warning with igraph 2.3.0+" \
    'When loading the Cascade package with igraph 2.3.0 or later, the following warning appears:

```
Warning: replacing previous import '"'"'igraph::circulant'"'"' by '"'"'magic::circulant'"'"' when loading '"'"'Cascade'"'"'
```

**Root cause**: igraph 2.3.0 added `make_circulant()` and its constructor alias `circulant()`. The `magic` package also exports `circulant()`, creating a namespace collision.

**Impact**: Minor – a warning is produced but Cascade continues to work correctly.

**Suggested fix**: Explicitly import `magic::circulant` in your NAMESPACE file:

```r
importFrom(magic, circulant)
```

This ensures `magic::circulant` takes precedence and suppresses the warning.

---
*Discovered during reverse dependency checking for igraph. Details: https://github.com/igraph/rigraph*' \
    "Namespace collision warning in Cascade with igraph 2.3.0+"

# --------------------------------------------------------------------------
# DiagrammeR
# --------------------------------------------------------------------------
notify_package \
    "DiagrammeR" \
    "https://github.com/rich-iannone/DiagrammeR" \
    "riannone@me.com" \
    "neighbors() now requires a single vertex ID in igraph 2.3.0+" \
    '`get_leverage_centrality()` fails with igraph 2.3.0 or later:

```
Error in `igraph::neighbors()`:
! `vid` must specify exactly one vertex
```

**Root cause**: igraph 2.3.0 adds strict validation that `neighbors()` must receive exactly one vertex ID. The call `igraph::neighbors(ig_graph, degree_vals)` passes a vector, which was previously silently reduced to the first element.

**Suggested fix**: Iterate over vertices individually:

```r
# In get_leverage_centrality(), wrap the body in a per-node loop, e.g.:
purrr::map(seq_along(degree_vals), function(i) {
  nb <- igraph::neighbors(ig_graph, i)
  mean((degree_vals[i] - degree_vals[nb]) / (degree_vals[i] + degree_vals[nb]))
})
```

---
*Discovered during reverse dependency checking for igraph. Details: https://github.com/igraph/rigraph*' \
    "neighbors() requires single vertex in DiagrammeR with igraph 2.3.0+"

# --------------------------------------------------------------------------
# jewel
# --------------------------------------------------------------------------
notify_package \
    "jewel" \
    "https://github.com/annaplaksienko/jewel" \
    "anna@plaxienko.com" \
    "Non-integer niter value passed to rewire() in igraph 2.3.0+" \
    'The jewel package fails with igraph 2.3.0 or later:

```
Error in rewire_impl(rewire = graph, n = niter, mode = mode) :
  The value 2.4500000000000002 is not representable as an integer. Invalid value
```

**Root cause**: igraph 2.3.0 strictly validates that `niter` is representable as an integer. The value `p * 0.05` (e.g., `49 * 0.05 = 2.45`) is not an integer.

**Suggested fix**: Wrap the computed value with `ceiling()` or `round()`:

```r
niter <- ceiling(p * 0.05)   # was: niter <- p * 0.05
```

---
*Discovered during reverse dependency checking for igraph. Details: https://github.com/igraph/rigraph*' \
    "Non-integer niter in jewel causes error with igraph 2.3.0+"

# --------------------------------------------------------------------------
# rSpectral
# --------------------------------------------------------------------------
notify_package \
    "rSpectral" \
    "https://github.com/cmclean5/rSpectral" \
    "lptolik@gmail.com" \
    "Modularity test failures due to automatic weight usage in igraph 2.3.0+" \
    'rSpectral tests fail with igraph 2.3.0 or later:

```
Expected `c$modularity` to equal `exp_mod10`.
Differences:
  `actual`: 0.432
`expected`: 0.408
```

**Root cause**: igraph 2.3.0 changed `modularity()` to automatically use the `"weight"` edge attribute when present. The test graphs have a `"weight"` attribute, so modularity is now computed with weights, giving different values.

**Options**:

1. Remove the unintended weight attribute:
   ```r
   g <- igraph::delete_edge_attr(g, "weight")
   ```

2. Update test graphs with `igraph::upgrade_graph()` and check whether weights are intentional.

3. Update expected test values if weighted modularity is the correct behavior.

---
*Discovered during reverse dependency checking for igraph. Details: https://github.com/igraph/rigraph*' \
    "Modularity test failures in rSpectral with igraph 2.3.0+"

# --------------------------------------------------------------------------
# sfnetworks
# --------------------------------------------------------------------------
notify_package \
    "sfnetworks" \
    "https://github.com/luukvdmeer/sfnetworks" \
    "luukvandermeer@live.nl" \
    "all_shortest_paths() from argument requires single vertex in igraph 2.3.0+" \
    '`st_network_paths()` fails with igraph 2.3.0 or later:

```
Error in `all_shortest_paths(x, from, to, weights = weights, ...)`:
! `from` must specify exactly one vertex
```

**Root cause**: igraph 2.3.0 adds strict validation that `all_shortest_paths(from = ...)` must receive exactly one vertex. sfnetworks passes a vector of "from" vertices.

**Suggested fix**: Iterate over each `from` vertex:

```r
lapply(from_vertices, function(f) {
  igraph::all_shortest_paths(x, from = f, to = to, weights = weights, ...)
})
```

---
*Discovered during reverse dependency checking for igraph. Details: https://github.com/igraph/rigraph*' \
    "all_shortest_paths() from must be single vertex in sfnetworks with igraph 2.3.0+"

# --------------------------------------------------------------------------
# Summary
# --------------------------------------------------------------------------
echo "=== Summary ==="
echo "Output directory: $OUTPUT_DIR"
echo ""
if [ -f "$OUTPUT_DIR/issue-log.txt" ]; then
    echo "GitHub issues filed:"
    cat "$OUTPUT_DIR/issue-log.txt"
    echo ""
fi
if ls "$OUTPUT_DIR"/*.txt &> /dev/null 2>&1; then
    email_files=$(ls "$OUTPUT_DIR"/*-email.txt 2>/dev/null || true)
    if [ -n "$email_files" ]; then
        echo "Email drafts created (review and send):"
        echo "$email_files"
    fi
fi
