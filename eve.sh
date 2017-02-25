#!/bin/sh

mkdir -p /tmp/repo
pwd=$(pwd)
cd /tmp/repo
git config --global user.email "${GIT_USER_EMAIL}"
git config --global user.name "${GIT_USER_NAME}"
git init
git remote add origin $1
sha=$(git rev-parse --short $(git ls-remote origin $2 | cut -f1))
cd $pwd
sed -i -e "s/$3 .*\$/$3 $sha/1" $4

