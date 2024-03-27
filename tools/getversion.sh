#! /bin/bash

script_dir=$( dirname "${BASH_SOURCE[0]}" )
cat DESCRIPTION | grep '^Version: ' | sed 's/^Version: \(.*\)$/\1/' | head -1
