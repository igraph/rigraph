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
    if [ -f $script_dir/NEXT_VERSION ]; then
        next_version=$( cat $script_dir/NEXT_VERSION )
        commits=$(git rev-list --count dev..HEAD) # Check commits from dev branch
        dev=$((9000 + commits))
        echo "${next_version}.${dev}"
    else
        latest_version=$(git describe --abbrev=0 HEAD)
        commits=$(git rev-list --count $(git describe --tags --abbrev=0)..HEAD)
        dev=$((9000 + commits))
        echo "${latest_version}.${dev}"
    fi
else
    echo "${thistag}"
fi
