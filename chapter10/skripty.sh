#!/bin/bash

echo "name of this beautiful script is $0"
echo "Chosen arguments $1, $3 ,${10}"
echo "total $#"
if [ #$ -gt 3 ]; then
echo "You just killed them arguments"
shift 3
fi
echo "total arguments is now $#"

