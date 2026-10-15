# The subset of a GitHub workflow-run object that a record on the `rcc2` branch
# carries, applied to `gh api repos/{owner}/{repo}/actions/runs/<id>`.
#
# Shared rather than inlined because two writers have to agree on it byte for
# byte: scripts/each-shard.sh (which publishes a record while the run is still
# going) and scripts/rcc-logs.sh (the hand-run backstop). A record is written
# once and never rewritten, so two writers disagreeing about the shape for the
# same run would stay invisible until a reader tripped over it.
#
# `status` and `conclusion` are as of the moment of writing. For a record a leg
# produces that is necessarily "in_progress"/null -- it is a job of the very run
# it describes -- which is what this path has always written; the per-commit
# verdict lives in `.status.state`, not here.
{
  id,
  name,
  head_branch,
  head_sha,
  event,
  status,
  conclusion,
  run_attempt,
  run_number,
  run_started_at,
  created_at,
  updated_at,
  html_url,
  display_title,
  actor: (.actor.login // null),
  triggering_actor: (.triggering_actor.login // null)
}
