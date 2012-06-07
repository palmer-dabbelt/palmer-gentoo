#!/bin/bash

# You should have good bandwidth to this server and it shouldn't be loaded
# very much because the current sync algorithm is very inefficient.
RSYNC_SERVER="rsync://server.dabbelt.com"

# These are the directories we care about syncing
git checkout master --quiet
all_files="$(mktemp)"
find *-* -maxdepth 1 -mindepth 1 > "$all_files"

# Syncs those directories in every branch
for branch in $(echo "gentoo-portage gentoo-portage-prefix")
do
    echo "Syncing $branch"
    git checkout $branch --quiet

    cat "$all_files" | while read directory
    do
	echo $directory
	mkdir -p $directory
	rsync -a --delete $RSYNC_SERVER/$branch/$directory/ $directory/ \
	    >& /dev/null
	git add $directory
    done

    git commit -am "auto-update for $branch"
done

rm "$all_files"

git checkout master --quiet
