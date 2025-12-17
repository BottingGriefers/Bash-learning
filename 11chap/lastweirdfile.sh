#!/bin/bash

mkdir -p ~/weirdfolder
echo "Created a weirdfolder"
cat << "DOS" > ~/weirdfolder/DOSstuff
function cls { clear }
function dir { ls -l "$@" }
function copy { cp -i "$@" }
DOS
echo "we have just created for you a DOS file"
cat << "DOS" >> ~/.bashrc
#-----_--------_---_-_--__-------------
printman() {
if [ -n "$2" ]; then man -t "$1" "$2" | lpr
else
man -t "$1" | lpr
fi }
if [ -d ~/wierdfolder ]; then
for f in ~/weirdfolder/*; do
if [ -f "$f" ]; then
source "$f"
fi
done
fi
DOS
echo "      1       1"
echo "     1 1     1 1"
echo "    1   11111   1"
echo "    1   0   0   1"
echo "    1     1     1"
echo "     11111111111"

