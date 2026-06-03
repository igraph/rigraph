# You can modify the PR comment footer here. You can use github markdown e.g.
# emojis like :tada:.
# This file will be parsed and evaluate within the context of
# `benchmark_analyze` and should return the comment text as the last value.
# See `?touchstone::pr_comment`
link <- "https://lorenzwalthert.github.io/touchstone/articles/inference.html"
glue::glue(
  "\nFurther explanation regarding interpretation and",
  " methodology can be found in the [documentation]({link})."
)
