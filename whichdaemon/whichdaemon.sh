#!/bin/bash

if ps -ef | grep "httpd"; then 
	echo "This machine is running a web server BUDDY"
fi

if ps -ef | grep "init"; then
	echo "this init daemon is running"
fi
