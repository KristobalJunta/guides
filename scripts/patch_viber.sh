#!/bin/bash

# This script patches viber.deb to require libssl1.1 instead of libssl1.0.0
# This assumes, that viber.deb is placed in the same directory as the script
# and creates a new deb, named viber-patched.deb in the same location

mkdir viber

pushd viber/
ar x ../viber.deb
tar xaf control.tar.gz
mv control control.bak
cat control.bak | sed 's/libssl1.0.0/libssl1.1/g' > control
tar --ignore-failed-read -cvzf control.tar.gz {post,pre}{inst,rm} md5sums control
ar rcs ../viber-patched.deb debian-binary control.tar.gz data.tar.xz
popd

sudo dpkg -i viber-patched.deb
rm -rf ./viber
