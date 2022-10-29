#!/bin/bash
# lines that start like this are shell comments
# read projects current directory with $PWD
echo “running command from” $PWD
cd $PWD
git add -A
echo “Enter commit message: “
git commit -m “$commitMessage”
git push origin gh-pages
