#!/bin/bash

cat $* | awk -F , '{print $7 "," $8 "," "\"" $1 "," $2 "\"" }'
