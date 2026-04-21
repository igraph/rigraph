#!/bin/bash
# Vendors igraph sources commit-by-commit from upstream repository
# Used by CI automation (.github/workflows/vendor.yaml)
# https://unix.stackexchange.com/a/654932/19205
# Using bash for -o pipefail

set -e
set -x
set -o pipefail

# Change to root of repository
cd "$(dirname "$0")"/..

project=igraph
vendor_base_dir=src/vendor
vendor_dir=${vendor_base_dir}/cigraph
repo_org=${project}
repo_name=${project}


upstream_basedir=""
num_commits=1

while [ $# -gt 0 ]; do
  case "$1" in
    --commits|-c)
      num_commits="$2"
      shift 2
      ;;
    -*)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
    *)
      upstream_basedir="$1"
      shift
      ;;
  esac
done

if [ -z "$upstream_basedir" ]; then
  upstream_basedir=../../../${project}
fi

upstream_dir=${project}

# Clone the repo only once if it doesn't exist
if [ ! -d "$upstream_dir" ]; then
  git clone "$upstream_basedir" "$upstream_dir"
elif [ "$upstream_basedir" != "$upstream_dir" ]; then
  # Update existing clone
  git -C "$upstream_dir" fetch origin
fi

if [ -n "$(git status --porcelain)" ]; then
  echo "Error: working directory not clean"
  exit 1
fi

if [ -n "$(git -C "$upstream_dir" status --porcelain)" ]; then
  echo "Warning: working directory $upstream_dir not clean"
fi

start=$(git -C "$upstream_dir" rev-parse --verify HEAD)

# Loop for the specified number of commits
commits_vendored=0

while [ $commits_vendored -lt $num_commits ]; do
  echo "=== Vendoring commit $((commits_vendored + 1)) of $num_commits ==="

  # Look back 10 commits to find the last vendor commit; needed when vendoring multiple commits per run
  base=$(git log -n 10 --format="%s" -- ${vendor_dir} | tee /dev/stderr | sed -nr '/^.*'${repo_org}.${repo_name}'@([0-9a-f]+)( .*)?$/{s//\1/;p;}' | head -n 1)

  original=$(git -C "$upstream_dir" log --first-parent --reverse --format="%H" "${base}".."${start}" --)

  if [ -z "$original" ]; then
    echo "No more commits to vendor. Done."
    rm -rf "$upstream_dir"
    exit 0
  fi

  message=
  is_tag=

  for commit in $original; do
    echo "Importing commit $commit"

    git -C "$upstream_dir" checkout "$commit" || {
      echo "Error: Failed to checkout commit $commit"
      rm -rf "$upstream_dir"
      exit 1
    }

    rm -rf ${vendor_dir}
    mkdir -p ${vendor_dir}

    git clone "$upstream_dir" ${vendor_dir}

    cmake -S${vendor_dir} -B${vendor_dir}/build

    mv ${vendor_dir}/build/include/igraph_version.h src/vendor/

    rm -rf ${vendor_dir}/.git ${vendor_dir}/.github ${vendor_dir}/doc ${vendor_dir}/examples ${vendor_dir}/fuzzing ${vendor_dir}/tests ${vendor_dir}/tools ${vendor_dir}/build

    for f in patch/*.patch; do
      if patch -i "$f" -p1 --forward --dry-run; then
        patch -i "$f" -p1 --forward --no-backup-if-mismatch
      else
        echo "Removing patch $f"
        rm "$f"
      fi
    done

    make -f Makefile-cigraph

    R -q -e 'cpp11::cpp_register()'

    # Always vendor tags
    if [ "$(git -C "$upstream_dir" describe --tags "$commit" | grep -c -- -)" -eq 0 ]; then
      message="vendor: Update vendored sources (tag $(git -C "$upstream_dir" describe --tags "$commit")) to ${repo_org}/${repo_name}@$commit"
      is_tag=true
      break
    fi

    # Expecting one change under ${vendor_base_dir} (and other changes) even if nothing else changed.
    # Need at least three changed files to consider it a real update.
    if [ "$(git status --porcelain -- ${vendor_base_dir} | wc -l)" -gt 1 ]; then
      message="vendor: Update vendored sources to ${repo_org}/${repo_name}@$commit"
      break
    fi
  done

  if [ "$message" = "" ]; then
    echo "No changes found. Done."
    git checkout -- ${vendor_base_dir}
    rm -rf "$upstream_dir"
    exit 0
  fi

  our_tag=$(git describe --tags --abbrev=0 | sed -r 's/-[0-9]$//')
  upstream_tag=$(git -C "$upstream_dir" describe --tags --abbrev=0)

  echo "Our tag: $our_tag"
  echo "Upstream tag: $upstream_tag"

  # Increase fifth version component by one
  # Set to one if missing
  # Set intermediate components to zero if missing
  # 1.2.3 -> 1.2.3.0.1
  # 1.2.3.9000 -> 1.2.3.9000.1
  # 1.2.3.9000.4 -> 1.2.3.9000.5
  version=$(sed -r -n '/^Version: (.*)$/ s//\1/p' DESCRIPTION)
  version_array=(${version//./ })
  for i in {0..4}; do
    if [ -z "${version_array[i]}" ]; then
      version_array[i]=0
    fi
  done
  version_array[4]=$((version_array[4] + 1))
  new_version=$(IFS=.; echo "${version_array[*]}")

  echo "Updating version from $version to $new_version"
  sed -i.bak -r 's/^(Version: ).*$/\1'"$new_version"'/' DESCRIPTION
  rm DESCRIPTION.bak

  git add .

  (
    echo "$message"
    echo
    git -C "$upstream_dir" log -1 --format="Date: %ai" "${commit}"
    echo
    git -C "$upstream_dir" log --first-parent --format="%s" "${base}".."${commit}" |
      tee /dev/stderr |
      sed -r 's%#([0-9]+)%https://redirect.github.com/'${repo_org}/${repo_name}'/pull/\1%g'
  ) | git commit --file /dev/stdin || {
    echo "Error: Failed to commit changes"
    rm -rf "$upstream_dir"
    exit 1
  }

  commits_vendored=$((commits_vendored + 1))

  echo "Successfully vendored commit $commits_vendored"

  # If we just vendored a tag, stop here
  if [ -n "${is_tag}" ]; then
    echo "Vendored a tag. Stopping."
    rm -rf "$upstream_dir"
    exit 0
  fi
done

echo "Successfully vendored $commits_vendored commit(s)"
rm -rf "$upstream_dir"
