#!/bin/bash
echo "testing error"

function quit { echo "You just pressed Ctrl+C this is not to good"; }
echo "test"
trap quit SIGINT
for i in {1..5}; do
echo "something with date... $i/5"
sleep 2
done
echo "lvl    1       1"
echo "Done  1 1     1 1"
echo "     1   11111   1"
echo "     1   0   0   1"
echo "     1     1     1"
echo "      11111111111"
trap '' SIGINT
echo "you can try it here"
sleep 2
echo "it didnt do shit" 
sleep 2
echo "same with this one"
sleep 2
trap - SIGINT
echo "Try now buddy ctrl+c"
sleep 10
echo "PRESS IT"
