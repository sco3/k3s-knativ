#!/usr/bin/env -S bash



./cpu-governor.sh
server=$(ps -aef | grep -v grep | \
grep -E -o 'bun|deno|node' \
| sort -u)

echo $server
echo ---
echo ''
echo '```'
wrk http://127.0.0.1:8000 -d 10 -t 2 -c 200
#-H "Hello, world\n"
echo '```'
