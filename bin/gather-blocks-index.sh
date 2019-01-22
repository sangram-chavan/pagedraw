#!/bin/bash -e

# generates src/blocks/index.cjsx

cd src/blocks

# copy the existing part of index.cjsx up until the autogenerated portion,
# marked becasue it starts with a line that's just two hash signs (##)
sed '/##/q' index.cjsx

# add, in sorted order, all the `require './my-block' lines
for bt in *-block.cjsx; do
    echo "require './`echo $bt | cut -d "." -f 1`'"
done