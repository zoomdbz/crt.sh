#!/bin/bash

for i in `cat ${1+"$@"} 2>/dev/null || echo ${1+"$@"}`;	do echo "$i" | xargs -I% -P 16 curl -s "https://crt.sh/?q=.%&output=json" | jq -r ".[].name_value" | sed "s/*.//g" | sort -u ; done
