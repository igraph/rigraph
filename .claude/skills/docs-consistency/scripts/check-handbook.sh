#!/bin/sh
# check-handbook: the mechanical checks of the handbook rules.
#
# Handbook: /handbook/checks/README.md owns what each finding means and how
# the script is run; /handbook/meta/handbook/README.md owns the rules it
# enforces. Judgment stays with the docs-consistency skill beside it.
#
# Findings print one per line as a tag, a path, and what is wrong. The exit
# status is 1 when there were any, 0 when the tree is clean, 2 on a usage
# error. Needs git and the usual POSIX tools, and nothing of the host project.

set -u

usage() {
  cat <<'USAGE'
Usage: check-handbook.sh [options] [check ...]

Runs the named checks, or every finding check when none is named, from
anywhere inside a git repository whose handbook lives under handbook/.

Checks that report findings:
  readme       every directory under handbook/ has a README.md
  ignored      no page under handbook/ is ignored by git
  children     every subdirectory is in its parent's child list
  nodes        no ## heading on an internal node
  links        internal links resolve, none climb with ../, and fragments
               match a heading
  derived      a derived document is newer than its derived_from: sources
  orphans      every document outside handbook/ derives from it, links into
               it, or is named by an index that does
  deepen       a deepen line is the last paragraph of its page
  experiments  the experiments registry and its directories agree
  em-dash      no em dash in a tracked file (on by default)

Reports, printed only when named:
  board        every page with its status, its verification date, and
               whether it still carries a deepen line
  lines        the deepen lines, with their pages

Options:
  --no-em-dash       drop the em-dash check from the default set
  --experiments DIR  the evidence directory (default: experiments)
  --ignore-file F    exemptions (default: .handbook-ignore at the root)
  --quiet            print the summary only
  -h, --help         this text

The ignore file holds one exemption per line, `glob` or `kind: glob`, with
# comments. A bare glob skips the path in every check; `orphan: glob`
exempts it from the orphan check alone, and `em-dash: glob` from the
em-dash check alone. A trailing / covers everything below the path, a glob
also matches below any directory, and * spans directory separators.
USAGE
}

FINDING_CHECKS='readme ignored children nodes links derived orphans deepen experiments'
REPORT_CHECKS='board lines'

HB=handbook
EXPERIMENTS=experiments
ignore_file=
quiet=0
em_dash=1
checks=

while [ $# -gt 0 ]; do
  case "$1" in
    --no-em-dash) em_dash=0 ;;
    --experiments)
      [ $# -ge 2 ] || { echo "check-handbook: --experiments needs a value" >&2; exit 2; }
      EXPERIMENTS=$2; shift ;;
    --ignore-file)
      [ $# -ge 2 ] || { echo "check-handbook: --ignore-file needs a value" >&2; exit 2; }
      ignore_file=$2; shift ;;
    --quiet) quiet=1 ;;
    -h | --help) usage; exit 0 ;;
    -*) echo "check-handbook: unknown option '$1'" >&2; usage >&2; exit 2 ;;
    *) checks="$checks $1" ;;
  esac
  shift
done

if [ -z "$checks" ]; then
  checks=$FINDING_CHECKS
  [ "$em_dash" = 1 ] && checks="$checks em-dash"
fi
for c in $checks; do
  case " $FINDING_CHECKS $REPORT_CHECKS em-dash " in
    *" $c "*) ;;
    *) echo "check-handbook: unknown check '$c'" >&2; exit 2 ;;
  esac
done

root=$(git rev-parse --show-toplevel 2>/dev/null) ||
  { echo "check-handbook: not inside a git repository" >&2; exit 2; }
cd "$root" || exit 2
[ -d "$HB" ] || { echo "check-handbook: no $HB/ directory in $root" >&2; exit 2; }

tmp=$(mktemp -d "${TMPDIR:-/tmp}/check-handbook.XXXXXX") || exit 2
trap 'rm -rf "$tmp"' EXIT INT TERM
findings=$tmp/findings
: >"$findings"

finding() { # tag path detail
  printf '%-12s %s' "$1" "$2" >>"$findings"
  [ -n "${3:-}" ] && printf ' (%s)' "$3" >>"$findings"
  printf '\n' >>"$findings"
}

# --- the files -------------------------------------------------------

# Tracked plus untracked-but-not-ignored, so a page being written is checked
# before it is staged, minus what is no longer on disk.
git ls-files --cached --others --exclude-standard | sort -u |
  while IFS= read -r f; do [ -f "$f" ] && printf '%s\n' "$f"; done >"$tmp/all_files"
grep '\.md$' "$tmp/all_files" >"$tmp/all_md" || true

# --- exemptions ------------------------------------------------------

: >"$tmp/ignore_all"
: >"$tmp/ignore_orphan"
: >"$tmp/ignore_emdash"
[ -z "$ignore_file" ] && [ -f .handbook-ignore ] && ignore_file=.handbook-ignore
if [ -n "$ignore_file" ]; then
  [ -f "$ignore_file" ] || { echo "check-handbook: no such ignore file: $ignore_file" >&2; exit 2; }
  sed -e 's/#.*//' -e 's/[[:space:]]*$//' -e '/^$/d' "$ignore_file" |
    while IFS= read -r line; do
      case "$line" in
        orphan:*) printf '%s\n' "${line#orphan:}" | sed 's/^[[:space:]]*//' >>"$tmp/ignore_orphan" ;;
        em-dash:*) printf '%s\n' "${line#em-dash:}" | sed 's/^[[:space:]]*//' >>"$tmp/ignore_emdash" ;;
        [a-z]*:*) printf '%s\n' "$line" >>"$tmp/bad_kind" ;;
        *) printf '%s\n' "$line" >>"$tmp/ignore_all" ;;
      esac
    done
  if [ -f "$tmp/bad_kind" ]; then
    echo "check-handbook: unknown kind in $ignore_file: $(head -1 "$tmp/bad_kind")" >&2
    exit 2
  fi
fi

# A trailing / means everything below; otherwise the glob stands as written.
# A glob also matches below any directory, and case globbing lets * span
# directory separators.
matches_list() { # listfile path
  while IFS= read -r pat; do
    [ -n "$pat" ] || continue
    case "$pat" in
      */)
        # shellcheck disable=SC2254
        case "$2" in $pat* | */$pat*) return 0 ;; esac ;;
      *)
        # shellcheck disable=SC2254
        case "$2" in $pat | */$pat) return 0 ;; esac ;;
    esac
  done <"$1"
  return 1
}
is_ignored() { matches_list "$tmp/ignore_all" "$1"; }

exempt=0
: >"$tmp/checked"
while IFS= read -r f; do
  if is_ignored "$f"; then exempt=$((exempt + 1)); else printf '%s\n' "$f" >>"$tmp/checked"; fi
done <"$tmp/all_md"
grep "^$HB/" "$tmp/checked" >"$tmp/pages" || true
grep -v "^$HB/" "$tmp/checked" >"$tmp/outside" || true

# --- helpers ---------------------------------------------------------

# An awk function shared by the readers below: the line with its HTML
# comments removed, tracking a comment that spans lines in `incomment`.
AWK_STRIP_COMMENTS='
  function strip_comments(line,   out, s, e) {
    out = ""
    while (1) {
      if (incomment) {
        e = index(line, "-->")
        if (!e) return out
        line = substr(line, e + 3); incomment = 0
      }
      s = index(line, "<!--")
      if (!s) return out line
      out = out substr(line, 1, s - 1)
      line = substr(line, s + 4)
      incomment = 1
    }
  }'

# Repository-relative path with . and .. folded away.
normpath() {
  printf '%s\n' "$1" | awk -F/ '{
    n = 0
    for (i = 1; i <= NF; i++) {
      if ($i == "" || $i == ".") continue
      if ($i == "..") { if (n) n--; continue }
      parts[++n] = $i
    }
    out = ""
    for (i = 1; i <= n; i++) out = out (i > 1 ? "/" : "") parts[i]
    print out
  }'
}

# Every ](target) outside fenced blocks, inline code, and HTML comments,
# one per line.
links_of() {
  awk "$AWK_STRIP_COMMENTS"'
    /^[[:space:]]*```/ { fence = !fence; next }
    fence { next }
    {
      line = strip_comments($0)
      gsub(/`[^`]*`/, "", line)
      while (match(line, /\]\([^)]*\)/)) {
        print substr(line, RSTART + 2, RLENGTH - 3)
        line = substr(line, RSTART + RLENGTH)
      }
    }' "$1"
}

# The slug of every heading, the way GitHub forms them: inline markup and
# ASCII punctuation dropped, spaces to hyphens, non-ASCII letters kept as
# written. An uppercase non-ASCII letter is the one case this misses.
slugs_of() {
  awk "$AWK_STRIP_COMMENTS"'
    /^[[:space:]]*```/ { fence = !fence; next }
    fence { next }
    { $0 = strip_comments($0) }
    /^#+[[:space:]]/ {
      t = $0
      sub(/^#+[[:space:]]+/, "", t)
      while (match(t, /\[[^]]*\]\([^)]*\)/)) {
        inner = substr(t, RSTART + 1, RLENGTH - 2)
        sub(/\]\(.*/, "", inner)
        t = substr(t, 1, RSTART - 1) inner substr(t, RSTART + RLENGTH)
      }
      gsub(/[`*]/, "", t)
      t = tolower(t)
      gsub(/[!-,.\/:-@[-^`{-~]/, "", t)
      gsub(/ /, "-", t)
      n = seen[t]++
      if (n) print t "-" n; else print t
    }' "$1"
}

# The derived_from: list of a document, read from front matter or from an
# HTML comment and never from prose.
sources_of() {
  awk '
    FNR == 1 { fm = ($0 == "---") }
    fm && FNR > 1 && $0 == "---" { fm = 0; grab = 0; next }
    /<!--/ { comment = 1 }
    fm || comment {
      if ($0 ~ /^[[:space:]]*derived_from:[[:space:]]*$/) grab = 1
      else if (grab && $0 ~ /^[[:space:]]*-[[:space:]]/) { sub(/^[[:space:]]*-[[:space:]]*/, ""); sub(/^\//, ""); print $0 }
      else grab = 0
    }
    /-->/ { comment = 0; grab = 0 }' "$1"
}

# A file's timestamp is its last commit, except where the working tree has
# moved past it: an edited or uncommitted file counts as changed now.
stamp_of() {
  ts=$(git log -1 --format=%ct -- "$1" 2>/dev/null)
  if [ -z "$ts" ] || [ -n "$(git status --porcelain -- "$1")" ]; then date +%s; else printf '%s\n' "$ts"; fi
}

# The internal links of a file that resolve into the tree, one per line:
# the backreferences. A target that starts with handbook/ counts whether or
# not it exists, because the link check reports a dangling one itself.
tree_links_of() {
  dir=${1%/*}
  [ "$dir" = "$1" ] && dir=.
  links_of "$1" | while IFS= read -r raw; do
    t=${raw%% *}
    t=${t%%#*}
    case "$t" in
      '' | '<'* | *://* | mailto:* | tel:*) continue ;;
    esac
    case "$t" in
      /*) r=$(normpath "$t") ;;
      *) r=$(normpath "$dir/$t") ;;
    esac
    case "$r" in "$HB" | "$HB"/*) printf '%s\n' "$r" ;; esac
  done
}

# The whole output is read rather than the first line, because a runner that
# ignores SIGPIPE would otherwise print an error for every write after head
# closed the pipe.
links_into_tree() { [ -n "$(tree_links_of "$1")" ]; }

# What the shared rules exempt from a backreference on their own: a license,
# and what a run captured beside an experiment record. Everything else a
# repository exempts is its ignore file's, with the reason beside it.
is_builtin_exempt() {
  case "$1" in
    LICENSE | LICENSE.md) return 0 ;;
    "$EXPERIMENTS"/README.md | "$EXPERIMENTS"/*/README.md) return 1 ;;
    "$EXPERIMENTS"/*) return 0 ;;
  esac
  return 1
}

# An in-place index carries the backreference for the files it names, so a
# document is covered where a README.md in its directory, or in one above it
# short of the root, links into the tree and names the file or a directory
# above it, as a link or in backticks.
index_covers() {
  f=$1
  d=${f%/*}
  [ "$d" = "$f" ] && return 1
  while :; do
    idx=$d/README.md
    if [ -f "$idx" ] && [ "$idx" != "$f" ] && links_into_tree "$idx"; then
      cand=${f#"$d"/}
      while :; do
        grep -qF "]($cand" "$idx" && return 0
        grep -qF "\`$cand" "$idx" && return 0
        case "$cand" in
          */*/) cand=${cand%/*/}/ ;;
          */) break ;;
          */*) cand=${cand%/*}/ ;;
          *) break ;;
        esac
      done
    fi
    case "$d" in */*) d=${d%/*} ;; *) break ;; esac
  done
  return 1
}

# --- the checks ------------------------------------------------------

check_readme() {
  find "$HB" -type d | sort | while IFS= read -r d; do
    is_ignored "$d/" && continue
    [ -f "$d/README.md" ] || finding MISSING "$d" "no README.md"
  done
}

check_ignored() {
  find "$HB" -name '*.md' -type f | sort | while IFS= read -r f; do
    is_ignored "$f" && continue
    git check-ignore -q "$f" && finding IGNORED "$f" "git ignores this page, so a clone lacks it"
  done
}

check_children() {
  find "$HB" -mindepth 1 -type d | sort | while IFS= read -r d; do
    is_ignored "$d/" && continue
    parent=${d%/*}
    name=${d##*/}
    [ -f "$parent/README.md" ] || continue
    awk -v name="$name" '
      /^[[:space:]]*[*-][[:space:]]/ && index($0, "](" name "/") { found = 1 }
      END { exit !found }' "$parent/README.md" ||
      finding UNLISTED "$d" "absent from $parent/README.md's child list"
  done
}

check_nodes() {
  find "$HB" -type d | sort | while IFS= read -r d; do
    is_ignored "$d/" && continue
    [ -f "$d/README.md" ] || continue
    [ -n "$(find "$d" -mindepth 1 -maxdepth 1 -type d | head -1)" ] || continue
    awk "$AWK_STRIP_COMMENTS"'
      /^[[:space:]]*```/ { fence = !fence; next }
      fence { next }
      { $0 = strip_comments($0) }
      /^##/ { print FNR ": " $0; exit }' "$d/README.md" |
      while IFS= read -r hit; do
        finding HEADING "$d/README.md:${hit%%:*}" "a heading on an internal node, which navigates and may govern but does not explain"
      done
  done
}

check_links_in() { # file inside
  f=$1
  inside=$2
  dir=${f%/*}
  [ "$dir" = "$f" ] && dir=.
  links_of "$f" | while IFS= read -r raw; do
    t=${raw%% *}
    case "$t" in
      '' | '<'* | *://* | mailto:* | tel:*) continue ;;
    esac
    frag=
    case "$t" in *'#'*) frag=${t#*#}; t=${t%%#*} ;; esac
    if [ -z "$t" ]; then
      [ "$inside" = 1 ] || continue
      resolved=$f
    else
      case "$t" in
        ../* | ..)
          if [ "$inside" = 1 ]; then
            finding UPWARD "$f" "$raw: a link leaving its directory is written from the repository root"
            continue
          fi ;;
      esac
      case "$t" in
        /*) resolved=$(normpath "$t") ;;
        *) resolved=$(normpath "$dir/$t") ;;
      esac
      if [ "$inside" != 1 ]; then
        case "$resolved" in "$HB" | "$HB"/*) ;; *) continue ;; esac
      fi
      if [ ! -e "$resolved" ]; then
        finding DANGLING "$f" "$raw"
        continue
      fi
    fi
    if [ -n "$frag" ] && [ -f "$resolved" ]; then
      case "$resolved" in
        *.md)
          slugs_of "$resolved" | grep -qxF "$frag" || finding ANCHOR "$f" "$raw: no such heading in $resolved" ;;
      esac
    fi
  done
}

check_links() {
  while IFS= read -r f; do check_links_in "$f" 1; done <"$tmp/pages"
  while IFS= read -r f; do check_links_in "$f" 0; done <"$tmp/outside"
}

check_derived() {
  if [ "$(git rev-parse --is-shallow-repository 2>/dev/null)" = true ]; then
    echo "note: this clone is shallow, so a source that changed before the shallow boundary cannot age the documents derived from it"
  fi
  while IFS= read -r doc; do
    sources=$(sources_of "$doc")
    [ -n "$sources" ] || continue
    doc_ts=$(stamp_of "$doc")
    printf '%s\n' "$sources" | while IFS= read -r src; do
      if [ ! -e "$src" ]; then
        finding SOURCE "$doc" "derived from $src, which does not exist"
        continue
      fi
      src_ts=$(stamp_of "$src")
      [ "$src_ts" -gt "$doc_ts" ] && finding STALE "$doc" "$src changed after the last derivation"
    done
  done <"$tmp/checked"
}

check_orphans() {
  while IFS= read -r f; do
    is_builtin_exempt "$f" && continue
    matches_list "$tmp/ignore_orphan" "$f" && continue
    [ -n "$(sources_of "$f")" ] && continue
    links_into_tree "$f" && continue
    index_covers "$f" && continue
    finding ORPHAN "$f" "neither derived from the handbook nor linking into it, and no index above it names it"
  done <"$tmp/outside"
}

check_deepen() {
  while IFS= read -r f; do
    awk -v page="$f" '
      NF == 0 { blank = 1; next }
      { if (blank || NR == 1) para++; blank = 0
        if ($0 ~ /^\*To deepen:/) { at[++n] = para; line[n] = FNR } }
      END {
        for (i = 1; i <= n; i++) if (at[i] != para || i < n) print line[i]
      }' "$f" | while IFS= read -r ln; do
        finding MIDPAGE "$f:$ln" "a deepen line is the last paragraph of its page, and there is one"
      done
  done <"$tmp/pages"
}

check_experiments() {
  [ -f "$EXPERIMENTS/README.md" ] || return 0
  is_ignored "$EXPERIMENTS/README.md" && return 0
  find "$EXPERIMENTS" -mindepth 1 -maxdepth 1 -type d | sort | while IFS= read -r d; do
    name=${d##*/}
    grep -qF "]($name/" "$EXPERIMENTS/README.md" || finding UNREGISTERED "$d" "not named in $EXPERIMENTS/README.md"
  done
  links_of "$EXPERIMENTS/README.md" | sed -n 's|^\([^/:#)]*\)/.*|\1|p' | sort -u | while IFS= read -r name; do
    [ -n "$name" ] || continue
    case "$name" in . | ..) continue ;; esac
    [ -e "$EXPERIMENTS/$name" ] || finding GONE "$EXPERIMENTS/README.md" "names $name/, which does not exist"
  done
}

# Every tracked text file, not Markdown alone: the rule a repository adopts
# reaches its code too. Commit messages are review's.
check_em_dash() {
  dash=$(printf '\342\200\224')
  while IFS= read -r f; do
    is_ignored "$f" && continue
    matches_list "$tmp/ignore_emdash" "$f" && continue
    grep -InF -- "$dash" "$f" 2>/dev/null | while IFS= read -r hit; do
      finding EM-DASH "$f:${hit%%:*}" "an em dash, which this repository does not write"
    done
  done <"$tmp/all_files"
}

report_board() {
  printf '%-52s %-10s %-12s %s\n' PAGE STATUS VERIFIED DEEPEN
  while IFS= read -r page; do
    awk -v page="$page" '
      FNR == 1 { fm = ($0 == "---") }
      fm && FNR > 1 && $0 == "---" { fm = 0; next }
      fm && FNR > 1 {
        if (sub(/^status:[[:space:]]*/, "")) s = $0
        else if (sub(/^verified:[[:space:]]*/, "")) v = $0
        next
      }
      NF == 0 { flush = 1; next }
      { if (flush) { block = ""; flush = 0 }
        block = (block == "" ? $0 : block " " $0) }
      END {
        printf "%-52s %-10s %-12s %s\n", page, (s == "" ? "-" : s), (v == "" ? "-" : v),
          (block ~ /^\*To deepen:/ ? "open" : "none")
      }' "$page"
  done <"$tmp/pages"
}

report_lines() {
  while IFS= read -r page; do
    awk -v page="$page" '
      NF == 0 { if (grab) exit; next }
      /^\*To deepen:/ { grab = 1 }
      grab { print page ": " $0 }' "$page"
  done <"$tmp/pages"
}

for c in $checks; do
  case "$c" in
    readme) check_readme ;;
    ignored) check_ignored ;;
    children) check_children ;;
    nodes) check_nodes ;;
    links) check_links ;;
    derived) check_derived ;;
    orphans) check_orphans ;;
    deepen) check_deepen ;;
    experiments) check_experiments ;;
    em-dash) check_em_dash ;;
    board) report_board ;;
    lines) report_lines ;;
  esac
done

# --- report ----------------------------------------------------------

count=$(wc -l <"$findings" | tr -d ' ')
pages=$(wc -l <"$tmp/pages" | tr -d ' ')
outside=$(wc -l <"$tmp/outside" | tr -d ' ')

if [ "$count" = 0 ]; then
  echo "check-handbook: clean ($pages pages, $outside secondary documents, $exempt exempt)"
  exit 0
fi

[ "$quiet" = 1 ] || sort "$findings"
files_hit=$(awk '{ sub(/:[0-9]+$/, "", $2); print $2 }' "$findings" | sort -u | wc -l | tr -d ' ')
echo "check-handbook: $count findings in $files_hit files ($pages pages, $outside secondary documents, $exempt exempt)"
exit 1
