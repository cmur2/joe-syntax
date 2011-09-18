#!/bin/bash

PREFIX="jsf-bundle"

if [[ $1 == "" ]]; then
	echo "Number missing!"
	exit 1
else
	num=$1
fi

tar cvf "${PREFIX}_$num.tar" --exclude="*.part.jsf" ./*.jsf
