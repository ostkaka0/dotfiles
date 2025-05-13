#!/bin/bash

echo "File: $1"
if [ -e $1 ]; then
	echo "File already exists!"
	exit 1
fi

date_str=`date +"%Y-%m-%d %T %Z"`
year_str=`date +"%Y"`

# output="// Copyright (C) John Emanuelsson - All rights reserved\n// Author: John Emanuelsson\n// File created$date_str\n"
output="// © $year_str John Emanuelsson\n// File created $date_str\n"
if [[ $1 == *.py ]]; then
	output="# © $year_str John Emanuelsson\n# File created $date_str\n"
fi
if [[ $1 == *.sh ]]; then
	output="# © $year_str John Emanuelsson\n# File created $date_str\n"
fi
if [[ $1 == *.lua ]]; then
	output="-- © $year_str John Emanuelsson\n-- File created $date_str\n"
fi

echo -e $output > $1
