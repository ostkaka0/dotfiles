#!/bin/bash

for f in "$@"
do
  echo $f
  if [ ! -f "$f.c" ]
  then
    git mv "$f.h" "$f.c"
    cp "$f.c" "$f.h"
  else
    echo "$f exists already!"
  fi
done

