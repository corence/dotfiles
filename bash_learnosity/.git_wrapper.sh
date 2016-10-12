#!/bin/bash
for arg in "$@"; do
	if [ "$arg" = "push" ]; then
		ispush=1
	elif [ "$ispush" = 1 -a "$arg" = '-f' ]; then
		echo "hey idiot, you need to break that dumb habit. why don't you try a nice '--force-with-lease' instead"
		exit 1
	fi
done

git "$@"
