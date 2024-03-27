#!/bin/bash
# Applies a patch file, returning successfully if the patch seems to be applied
# already

if [ "x$1" = x ]; then
    echo "Usage: $0 patch-file"
    exit 1
fi

OUT=$(patch -p1 -t -N -r .reject -i $1)
RETVAL=$?

if [ $RETVAL = 0 ]; then
    # Everything went fine
    exit
elif [ $RETVAL = 1 ]; then
    rm -f .reject
    # Maybe the patch was reversed?
	COUNT=`echo "$OUT" | grep -E -c "^(Reversed.*Skipping)|(Ignoring previously applied)"`
    if [ $COUNT -gt 0 ]; then
        echo "$1 seems to be applied already, skipping."
		exit
    fi
fi

# Some other error
echo "$OUT"
exit $RETVAL

