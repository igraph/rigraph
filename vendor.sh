#!/bin/bash

set -e
set -x
set -o pipefail

cd `dirname $0`

if [ -z "$1" ]; then
  upstream_dir=../../igraph
else
  upstream_dir="$1"
fi

if [ -n "$(git status --porcelain)" ]; then
  echo "Error: working directory not clean"
  exit 1
fi

if [ -n "$(git -C "$upstream_dir" status --porcelain)" ]; then
  echo "Warning: working directory $upstream_dir not clean"
fi

vendor_dir=src/vendor/cigraph
repo_org=igraph
repo_name=igraph

commit=$(git -C "$upstream_dir" rev-parse HEAD)

base=$(git log -n 3 --format="%s" -- ${vendor_dir} | tee /dev/stderr | sed -nr '/^.*'${repo_org}'.'${repo_name}'@([0-9a-f]+)$/{s//\1/;p;}' | head -n 1)

message=

for commit in $commit; do
  echo "Importing commit $commit"

  rm -rf ${vendor_dir}
  mkdir -p ${vendor_dir}

  git clone "$upstream_dir" ${vendor_dir}

  cmake -S${vendor_dir} -B${vendor_dir}/build

  mv ${vendor_dir}/build/include/igraph_version.h src/vendor/

  rm -rf ${vendor_dir}/.git ${vendor_dir}/.github ${vendor_dir}/doc ${vendor_dir}/examples ${vendor_dir}/fuzzing ${vendor_dir}/tests ${vendor_dir}/tools ${vendor_dir}/build

  make -f Makefile-cigraph

  R -q -e 'cpp11::cpp_register()'

  # Always vendor tags
  if [ $(git -C "$upstream_dir" describe --tags "$commit" | grep -c -- -) -eq 0 ]; then
    message="chore: Update vendored sources (tag $(git -C "$upstream_dir" describe --tags "$commit")) to ${repo_org}/${repo_name}@$commit"
    break
  fi

  if [ $(git status --porcelain -- ${vendor_dir} | wc -l) -gt 1 ]; then
    message="chore: Update vendored sources to ${repo_org}/${repo_name}@$commit"
    break
  fi
done

if [ "$message" = "" ]; then
  echo "No changes."
  git checkout -- ${vendor_dir}
  exit 0
fi

git add .

(
  echo "$message"
  echo
  git -C "$upstream_dir" log --first-parent --format="%s" ${base}..${commit} | tee /dev/stderr | sed -r 's%(#[0-9]+)%${repo_org}/${repo_name}\1%g'
) | git commit --file /dev/stdin
