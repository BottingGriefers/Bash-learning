#!/bin/bash
if [ -z "$1" ]; then
echo "Error please provice a downloadable url"
echo "You have use it like this ./installer.sh <link> "
exit 1
fi
URL="$1"
ARCHIVE=$(basename "$URL") #forgor to put $ before url made almost died
FOLDER="${ARCHIVE%.tar.gz}"
echo "url $URL"
echo "File $ARCHIVE"
echo "Folder $FOLDER"

echo "DOWNLOADING this stuff $URL"
wget -q --show-progress "$URL"

echo "Extracting this stuff $ARCHIVE"
tar -xzf "$ARCHIVE"

echo "wrappign up the stuff"
cd "$FOLDER"
./configure
make -j$(nproc)

echo "YOU CANT ctrl + c you knoob"
trap "" SIGINT
sudo make install
trap - SIGINT
echo "now you are able to do what you want"

