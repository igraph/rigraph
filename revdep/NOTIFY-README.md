# Maintainer Notification Script

This script (`notify-maintainers.sh`) automates the process of notifying package maintainers about reverse dependency issues discovered during igraph development.

## Features

- **GitHub Integration**: Automatically creates GitHub issues for packages hosted on GitHub
- **Email Fallback**: Generates email drafts (with pre-filled `To:` and `Cc:` fields) for packages not on GitHub, or optionally for all packages after filing a GitHub issue
- **Issue log**: Records all filed GitHub issue URLs for easy follow-up
- **Template-based**: Creates well-formatted issue descriptions with all relevant information

## Prerequisites

### For GitHub Issues (Optional)

```bash
# Install GitHub CLI
# On macOS:
brew install gh

# On Linux:
# See https://github.com/cli/cli#installation

# Authenticate with GitHub
gh auth login
```

Note: Issues are created on behalf of the authenticated GitHub user. Ensure you are logged in with appropriate credentials before running the script.

### For Email Drafts

No additional setup required – the script automatically fetches maintainer emails from CRAN and pre-fills the `To:` field in each draft.

## Usage

```bash
./notify-maintainers.sh
```

The script will:

1. Check if `gh` CLI is available
2. For each affected package:
   - Look up the maintainer email from the package DESCRIPTION field stored in CRAN
   - Determine whether the package repository on GitHub is accessible
   - If accessible: Create a GitHub issue directly using `gh issue create` and log the issue URL
   - If not accessible: Create an email draft in `notifications/` with the maintainer email pre-filled

The script determines upfront which action to take for each package (either GitHub issue OR email draft, not both). Regardless of which path is taken, issue links are always stored in `notifications/issue-log.txt` for follow-up tracking.

## Output

Files are created in the `notifications/` directory:

- `issue-log.txt` – URLs of all GitHub issues created (for follow-up)
- `{Package}-email.txt` – Complete email draft **only for packages that require email drafts** (GitHub not accessible)

For packages with accessible GitHub repositories, issues are created directly; no local files other than the log entry are saved.

## Manual Steps

### If GitHub Issues Fail

If you see authentication or permission errors when creating GitHub issues:

1. Check GitHub authentication: `gh auth status`
2. Authenticate if needed: `gh auth login`
3. Or manually create issues via the GitHub web interface

### For Email Drafts

When GitHub repositories are not accessible, email drafts are automatically generated with:

- `To:` pre-filled with the package maintainer's CRAN email address
- `Cc:` pre-filled with the igraph development team address

To send these emails:

1. Review the email content in `notifications/{Package}-email.txt`
2. Open your email client and compose a new message
3. Copy the `To:`, `Cc:`, `Subject:`, and body content

## Package Information

The script's package list and issue templates need to be updated each time a new set of revdep issues is identified. Package information (GitHub URL, maintainer email) is sourced from the CRAN package metadata (`DESCRIPTION` fields as reported by CRAN).

## Customization

To modify the issue templates or add packages to the notification list, edit the script directly. Each package section follows this pattern:

```bash
PACKAGE="PackageName"
GITHUB_URL="https://github.com/owner/repo"
MAINTAINER_EMAIL="maintainer@example.com"  # from CRAN DESCRIPTION

ISSUE_TITLE="Short description of the issue"
ISSUE_BODY="..."
EMAIL_SUBJECT="..."

notify_package "$PACKAGE" "$GITHUB_URL" "$MAINTAINER_EMAIL" "$ISSUE_TITLE" "$ISSUE_BODY" "$EMAIL_SUBJECT"
```

## Troubleshooting

### "gh CLI not found"
Install the GitHub CLI as described in Prerequisites.

### "Failed to create issue"
- Check GitHub authentication: `gh auth status`
- Ensure you have permission to create issues in the repository
- The repository might be private

### "GitHub repository not accessible"
- The repository might be private
- There might be no link to the repository in the package metadata
- Use the email draft fallback instead

## See Also

- [problems-analysis.md](problems-analysis.md) - Detailed analysis of each issue
- [examples/](examples/) - Runnable reproduction scripts
- [cran-response-draft.md](cran-response-draft.md) - Draft response to CRAN review email
