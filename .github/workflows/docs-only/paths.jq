# The paths of one entry of the GitHub API's list of changed files:
# a rename has the new path in `filename` and the old one in
# `previous_filename`, and moving code out of a checked path is a change too.
.filename, (.previous_filename // empty)
