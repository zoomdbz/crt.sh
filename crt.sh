#!/bin/bash

for i in `cat ${1+"$@"} 2>/dev/null || echo ${1+"$@"}`;	do curl --parallel --parallel-immediate --parallel-max 12 -s "https://crt.sh/?q=.$i&output=json" | jq -r ".[].name_value" | sed "s/*.//g" | sort -u ; done
