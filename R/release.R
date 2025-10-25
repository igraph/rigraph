# https://usethis.r-lib.org/reference/use_release_issue.html#customization
# https://github.com/igraph/rigraph/issues/1976
release_bullets <- function() {
  c(
    "`allcontributors::add_contributors()` to update allcontributors' data in the README.",
    "Update docs based on the C docs.",
    "Draft a post for the igraph and cynkra blogs.",
    "Submit link to that post to R weekly + cynkra's social media platforms.",
    "Add the link to the blog post to the pkgdown's release menu.",
    "Announce the release on the igraph forum."
  )
}
