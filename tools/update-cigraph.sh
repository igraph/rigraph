#!/bin/bash

set -e
set -x
set -o pipefail

cd $(dirname $0)/..

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

commit=$(git -C "$upstream_dir" rev-parse HEAD)
echo "Importing commit $commit"

base=$(git log -n 1 --format="%s" -- src/vendor/cigraph | sed -r 's#^.*igraph/igraph@(.*)$|^.*$#\1#')

rm -rf src/vendor/cigraph
mkdir -p src/vendor/cigraph

git clone "$upstream_dir" src/vendor/cigraph

cmake -Ssrc/vendor/cigraph -Bsrc/vendor/cigraph/build

mv src/vendor/cigraph/build/include/igraph_version.h src/vendor/

rm -rf src/vendor/cigraph/.git src/vendor/cigraph/.github src/vendor/cigraph/doc src/vendor/cigraph/examples src/vendor/cigraph/fuzzing src/vendor/cigraph/tests src/vendor/cigraph/tools src/vendor/cigraph/build

if [ $(git status --porcelain -- src/vendor | wc -l) -le 0 ]; then
  echo "No changes."
  git checkout -- src/vendor
  exit 0
fi

make -f Makefile-cigraph

R -q -e 'cpp11::cpp_register()'

git add src/vendor src/*.mk R/aaa-auto.R src/cpp11.cpp src/rinterface.c

(
  echo "chore: Update vendored sources to igraph/igraph@$commit"
  echo
  git -C "$upstream_dir" log --first-parent --format="%s" ${base}..${commit} | sed -r 's%(#[0-9]+)%igraph/igraph\1%g'
) | git commit --file /dev/stdin

git cherry-pick b6f576d25dc2c02dfeb2979716ef4809e4404c99 --no-edit
