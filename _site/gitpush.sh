#!/bin/sh

CurrentTS=`date '+%Y%m%d_%H%M%S'`
echo "$CurrentTS"
cd `dirname $0`
ROOT_PATH=`pwd`

echo $ROOT_PATH

echo "$CurrentTS"

read message
#echo `git status`
git add -A
git status
echo "Pushing data to remote server!!!"
git commit -m "date '+%Y%m%d_%H%M%S' ${message}"
git push origin gh-pages


exit 0
