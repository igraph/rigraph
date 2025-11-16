#!/bin/bash
# Script to notify package maintainers about reverse dependency issues
# This script creates GitHub issues for packages hosted on GitHub
# or creates Gmail draft emails for packages not on GitHub

set -e

# Check if gh CLI is available
if ! command -v gh &> /dev/null; then
    echo "Warning: gh CLI not found. Will only create email drafts."
    GH_AVAILABLE=0
else
    GH_AVAILABLE=1
fi

# Function to check if a GitHub repo exists and is accessible
check_github_repo() {
    local repo=$1
    if [ $GH_AVAILABLE -eq 0 ]; then
        return 1
    fi
    
    # Extract owner/repo from URL
    local owner_repo=$(echo "$repo" | sed 's|https://github.com/||' | sed 's|\.git$||')
    
    # Check if repo is accessible
    if gh repo view "$owner_repo" &> /dev/null; then
        echo "$owner_repo"
        return 0
    else
        return 1
    fi
}

# Function to create a Gmail draft
create_gmail_draft() {
    local package=$1
    local email_file=$2
    
    echo "Creating Gmail draft for $package..."
    echo "Please manually create an email with the following content:"
    echo "================================================"
    cat "$email_file"
    echo "================================================"
    echo ""
    echo "Email draft content saved to: $email_file"
}

# Function to get maintainer email from CRAN
get_maintainer_email() {
    local package=$1
    # This would need to scrape CRAN or use an API
    # For now, return a placeholder
    echo "maintainer@example.com"
}

# Directory for output files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/notifications"
mkdir -p "$OUTPUT_DIR"

echo "=== Notifying Package Maintainers about Reverse Dependency Issues ==="
echo ""

# Package 1: Cascade
# GitHub: https://github.com/fbertran/Cascade
PACKAGE="Cascade"
GITHUB_URL="https://github.com/fbertran/Cascade"
VERSION="2.3"
ISSUE_TYPE="Namespace Collision Warning"
SEVERITY="Minor"

cat > "$OUTPUT_DIR/${PACKAGE}-issue.md" << 'EOF'
# Namespace collision warning with igraph 2.2.1.9003+

## Summary

When loading the Cascade package with igraph version 2.2.1.9003 or later, the following warning appears:

```
Warning: replacing previous import 'igraph::circulant' by 'magic::circulant' when loading 'Cascade'
```

## Root Cause

igraph recently added a new function `make_circulant()` and its constructor alias `circulant()` in version 2.2.1.9003. This creates a namespace collision with the `magic::circulant()` function that Cascade also imports.

## Impact

This is a **minor** issue - it produces a warning but does not prevent Cascade from working correctly.

## Suggested Fix

To resolve this warning, you can explicitly import `magic::circulant` in your NAMESPACE file:

```r
importFrom(magic, circulant)
```

This will ensure that `magic::circulant` takes precedence and the warning will not appear.

## Additional Information

- **igraph version with issue**: 2.2.1.9003+
- **Cascade version tested**: 2.3
- **Severity**: Minor (warning only, no functionality broken)

This issue was discovered during reverse dependency checking for igraph. For more details, see the igraph repository.

## References

- igraph change: Added `make_circulant()` to expose `igraph_circulant()` (#1563, #2407)
- igraph repository: https://github.com/igraph/rigraph
EOF

echo "Package: $PACKAGE"
if owner_repo=$(check_github_repo "$GITHUB_URL"); then
    echo "  ✓ GitHub repository found: $owner_repo"
    if [ $GH_AVAILABLE -eq 1 ]; then
        echo "  Creating GitHub issue..."
        # Create the issue
        gh issue create \
            --repo "$owner_repo" \
            --title "Namespace collision warning with igraph 2.2.1.9003+" \
            --body-file "$OUTPUT_DIR/${PACKAGE}-issue.md" \
            --label "bug" \
            || echo "  ⚠ Failed to create issue (may need authentication or permissions)"
    fi
else
    echo "  ✗ GitHub repository not accessible, creating email draft..."
    MAINTAINER_EMAIL=$(get_maintainer_email "$PACKAGE")
    cat > "$OUTPUT_DIR/${PACKAGE}-email.txt" << EOF
To: $MAINTAINER_EMAIL
Subject: Namespace collision warning with igraph 2.2.1.9003+ in Cascade

Dear Cascade Maintainer,

$(cat "$OUTPUT_DIR/${PACKAGE}-issue.md")

Best regards,
igraph Development Team
EOF
    create_gmail_draft "$PACKAGE" "$OUTPUT_DIR/${PACKAGE}-email.txt"
fi
echo ""

# Package 2: jewel
PACKAGE="jewel"
GITHUB_URL="https://github.com/annaplaksienko/jewel"
VERSION="2.0.2"
ISSUE_TYPE="Integer Validation Error"
SEVERITY="High"

cat > "$OUTPUT_DIR/${PACKAGE}-issue.md" << 'EOF'
# Integer validation error with igraph 2.2.1.9003+

## Summary

The jewel package fails with igraph version 2.2.1.9003 or later due to strict integer validation:

```
Error in rewire_impl(rewire = graph, n = niter, mode = mode) : 
  At rinterface_extra.c:83 : The value 2.4500000000000002 is not representable as an integer. Invalid value
```

## Root Cause

The `generateData_rewire()` function (or similar code) passes non-integer values to igraph's `rewire()` function for the `niter` parameter. Previous versions of igraph silently truncated these values, but newer versions strictly validate that numeric values are representable as integers.

## Minimal Reproducible Example

```r
library(igraph)
g <- make_ring(10)

# This now fails
rewire(g, keeping_degseq(niter = 2.45))
# Error: The value 2.4500000000000002 is not representable as an integer
```

## Impact

This is a **high severity** issue - it causes the package to fail completely during examples and likely in actual usage.

## Suggested Fix

Ensure that `niter` values are integers before passing to `rewire()`:

```r
# Instead of:
niter <- p * 0.05

# Use:
niter <- ceiling(p * 0.05)  # or floor() or round(), depending on desired behavior
```

## Example from jewel code

Looking at the error message, this likely occurs in code like:

```r
# Problematic:
n <- 49
niter <- n * 0.05  # = 2.45
rewire(graph, keeping_degseq(niter = niter))

# Fixed:
niter <- ceiling(n * 0.05)  # = 3
rewire(graph, keeping_degseq(niter = niter))
```

## Additional Information

- **igraph version with issue**: 2.2.1.9003+
- **jewel version tested**: 2.0.2
- **Severity**: High (package functionality broken)

This issue was discovered during reverse dependency checking for igraph. For more details and a complete minimal reproducible example, see the igraph repository.

## References

- igraph repository: https://github.com/igraph/rigraph
- Related to stricter integer validation in igraph C code
EOF

echo "Package: $PACKAGE"
if owner_repo=$(check_github_repo "$GITHUB_URL"); then
    echo "  ✓ GitHub repository found: $owner_repo"
    if [ $GH_AVAILABLE -eq 1 ]; then
        echo "  Creating GitHub issue..."
        gh issue create \
            --repo "$owner_repo" \
            --title "Integer validation error with igraph 2.2.1.9003+" \
            --body-file "$OUTPUT_DIR/${PACKAGE}-issue.md" \
            --label "bug" \
            || echo "  ⚠ Failed to create issue (may need authentication or permissions)"
    fi
else
    echo "  ✗ GitHub repository not accessible, creating email draft..."
    MAINTAINER_EMAIL=$(get_maintainer_email "$PACKAGE")
    cat > "$OUTPUT_DIR/${PACKAGE}-email.txt" << EOF
To: $MAINTAINER_EMAIL
Subject: Integer validation error with igraph 2.2.1.9003+ in jewel

Dear jewel Maintainer,

$(cat "$OUTPUT_DIR/${PACKAGE}-issue.md")

Best regards,
igraph Development Team
EOF
    create_gmail_draft "$PACKAGE" "$OUTPUT_DIR/${PACKAGE}-email.txt"
fi
echo ""

# Package 3: rSpectral
PACKAGE="rSpectral"
GITHUB_URL="https://github.com/cmclean5/rSpectral"
VERSION="1.0.0.10"
ISSUE_TYPE="Modularity Test Failures"
SEVERITY="Medium"

cat > "$OUTPUT_DIR/${PACKAGE}-issue.md" << 'EOF'
# Modularity test failures with igraph 2.2.1.9004+

## Summary

rSpectral tests fail with igraph version 2.2.1.9004 or later due to changes in modularity calculation behavior:

```
Expected `c$modularity` to equal `exp_mod10`.
Differences:
  `actual`: 0.432
`expected`: 0.408
```

## Root Cause

igraph v2.2.1.9004 changed `modularity()` to automatically use the `"weight"` edge attribute if present:

```r
if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
  weights <- E(graph)$weight
}
```

This means graphs with a "weight" attribute now compute weighted modularity by default, even when `weights = NULL` is explicitly passed.

## Impact

This is a **medium severity** issue - tests fail but core functionality may still work. The modularity values are close but not exact.

## Workaround Available

A simple workaround exists: pass `weights = numeric()` to force unweighted modularity calculation:

```r
# Instead of:
modularity(g, membership)
# or
modularity(g, membership, weights = NULL)

# Use:
modularity(g, membership, weights = numeric())
```

This works because `numeric()` is not `NULL` (skips auto-detection), but `!all(is.na(numeric()))` evaluates to `FALSE`, causing the code to set `weights <- NULL` internally.

## Suggested Fixes

Choose one of the following approaches:

1. **Quick fix**: Use the workaround above in places where unweighted modularity is needed
2. **Update graph objects**: Call `igraph::upgrade_graph()` on saved graph objects
3. **Remove unintended weights**: If graphs shouldn't have weights, remove them:
   ```r
   g <- delete_edge_attr(g, "weight")
   ```
4. **Update test expectations**: If weighted modularity is correct, update expected values in tests

## Additional Information

- **igraph version with issue**: 2.2.1.9004+
- **rSpectral version tested**: 1.0.0.10
- **Severity**: Medium (tests fail, but workaround available)
- **Test message**: "This graph was created by an old(er) igraph version"

This issue was discovered during reverse dependency checking for igraph. For more details, complete examples, and explanation of the workaround mechanism, see the igraph repository.

## References

- igraph repository: https://github.com/igraph/rigraph
- igraph change: "Use 'weights' edge attribute in modularity() if available"
EOF

echo "Package: $PACKAGE"
if owner_repo=$(check_github_repo "$GITHUB_URL"); then
    echo "  ✓ GitHub repository found: $owner_repo"
    if [ $GH_AVAILABLE -eq 1 ]; then
        echo "  Creating GitHub issue..."
        gh issue create \
            --repo "$owner_repo" \
            --title "Modularity test failures with igraph 2.2.1.9004+" \
            --body-file "$OUTPUT_DIR/${PACKAGE}-issue.md" \
            --label "bug" \
            || echo "  ⚠ Failed to create issue (may need authentication or permissions)"
    fi
else
    echo "  ✗ GitHub repository not accessible, creating email draft..."
    MAINTAINER_EMAIL=$(get_maintainer_email "$PACKAGE")
    cat > "$OUTPUT_DIR/${PACKAGE}-email.txt" << EOF
To: $MAINTAINER_EMAIL
Subject: Modularity test failures with igraph 2.2.1.9004+ in rSpectral

Dear rSpectral Maintainer,

$(cat "$OUTPUT_DIR/${PACKAGE}-issue.md")

Best regards,
igraph Development Team
EOF
    create_gmail_draft "$PACKAGE" "$OUTPUT_DIR/${PACKAGE}-email.txt"
fi
echo ""

echo "=== Summary ==="
echo "Issue templates created in: $OUTPUT_DIR"
echo ""
echo "Files created:"
ls -1 "$OUTPUT_DIR"
echo ""
echo "To manually create issues or send emails, review the files in $OUTPUT_DIR"
