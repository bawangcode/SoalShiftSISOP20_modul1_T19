#!/bin/bash

cat /dev/urandom | tr -dc '0-9 A-Z a-z' | fold -w 28 | head -n 1 | sed 's/ //g' > `echo $1 | tr -dc 'A-Z a-z'`.txt
