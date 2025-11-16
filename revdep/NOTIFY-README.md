# Maintainer Notification Script

This script (`notify-maintainers.sh`) automates the process of notifying package maintainers about reverse dependency issues discovered during igraph development.

## Features

- **GitHub Integration**: Automatically creates GitHub issues for packages hosted on GitHub
- **Email Fallback**: Generates email drafts for packages not on GitHub or when GitHub access fails
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

### For Email Drafts

No additional setup required - the script will generate email templates that can be manually sent.

## Usage

```bash
./notify-maintainers.sh
```

The script will:

1. Check if `gh` CLI is available
2. For each package (Cascade, jewel, rSpectral):
   - Create an issue template in `notifications/`
   - If the GitHub repository is accessible:
     - Attempt to create a GitHub issue using `gh issue create`
   - Otherwise:
     - Create an email draft template

## Output

All files are created in the `notifications/` directory:

- `{Package}-issue.md` - GitHub issue template / email body
- `{Package}-email.txt` - Complete email draft (when applicable)

## Manual Steps

### If GitHub Issues Fail

If you see authentication or permission errors, you can manually create issues by:

1. Navigate to the package's GitHub repository
2. Click "Issues" → "New Issue"
3. Copy the content from `notifications/{Package}-issue.md`

### For Email Drafts

1. Review the email content in `notifications/{Package}-email.txt`
2. Copy the content
3. Create a new email in your email client
4. Paste the content and send

## Package Information

### Cascade
- **GitHub**: https://github.com/fbertran/Cascade
- **Issue**: Namespace collision warning
- **Severity**: Minor

### jewel
- **GitHub**: https://github.com/annaplaksienko/jewel
- **Issue**: Integer validation error
- **Severity**: High

### rSpectral
- **GitHub**: https://github.com/cmclean5/rSpectral
- **Issue**: Modularity test failures
- **Severity**: Medium

## Customization

To modify the issue templates or add more packages, edit the script directly. Each package section follows this pattern:

```bash
PACKAGE="PackageName"
GITHUB_URL="https://github.com/owner/repo"
VERSION="x.y.z"
ISSUE_TYPE="Description"
SEVERITY="High/Medium/Low"

cat > "$OUTPUT_DIR/${PACKAGE}-issue.md" << 'EOF'
# Issue title

Issue description...
EOF
```

## Troubleshooting

### "gh CLI not found"
Install the GitHub CLI as described in Prerequisites.

### "Failed to create issue"
- Check GitHub authentication: `gh auth status`
- Ensure you have permission to create issues in the repository
- The repository may have issues disabled

### "GitHub repository not accessible"
- The repository might be private
- The repository URL might be incorrect
- Use the email draft fallback instead

## See Also

- [problems-analysis.md](problems-analysis.md) - Detailed analysis of each issue
- [examples/](examples/) - Runnable reproduction scripts
