#! /bin/bash

script_dir=$( dirname "${BASH_SOURCE[0]}" )
if [ ! -d $script_dir/../.git ]; then
    # Not a git repo, so try to infer the version number from the
    # changelog
    cat DESCRIPTION | grep '^Version: ' | sed 's/^Version: \(.*\)$/\1/' | head -1
    exit 1
fi

thistag=$(git describe --exact-match --tags HEAD 2>/dev/null || true)

if [ -z "${thistag}" ]; then
    latest_version=$(git describe --abbrev=0 HEAD)
    commits=$(git rev-list --count $(git describe --tags --abbrev=0)..HEAD)
    dev=$((9000 + commits))
    echo "${latest_version}.${dev}"
else
    echo "${thistag}"
fi
