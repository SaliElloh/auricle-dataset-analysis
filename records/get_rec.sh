#!/bin/bash
REC="$1"
BASE="https://physionet.org/files/auricle/1.0.0/data"
[ -z "$REC" ] && exit 0
[ -f "$REC.hea" ] || curl -fsSLO "$BASE/$REC/$REC.hea"
for F in $(awk 'NR>1 && NF {print $1}' "$REC.hea" | sort -u); do
  curl -fsSLO -C - "$BASE/$REC/$F"
done
echo "done $REC"
