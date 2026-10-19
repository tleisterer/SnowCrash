#!/usr/bin/env bash

# reset everything
chmod 777 ~
rm -rf /tmp/dir0 /tmp/dir1 ~/public_file

# create the directories and files
mkdir -p /tmp/dir0
mkdir -p /tmp/dir1
echo "some content to debug" > ~/public_file

chmod 777 ~/public_file

# create the symlinks
[ -L ~/activedir ] && unlink ~/activedir
rm -rf ~/activedir

ln -s ~/activedir /tmp/dir0
ln -sf ~/public_file /tmp/dir0/lnk
ln -sf ~/token /tmp/dir1/lnk

echo "symlinks are setup"

"$@"
