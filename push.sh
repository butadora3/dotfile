#!/bin/sh

if [ $# -eq 0 ]; then
	echo "Please enter the commit message"
	echo
	echo "Ex. push.sh [commit message]"
	exit 1
fi

git add -A
git commit -m "$@"
git push origin master
