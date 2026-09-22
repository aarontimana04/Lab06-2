#!/bin/bash

N=${1:-10}
URL="http://localhost:30080/pod"

echo "== $N peticiones a $URL =="
echo

TMP_FILE=$(mktemp)

for i in $(seq 1 "$N"); do
    POD=$(curl -s "$URL" | sed -E 's/.*"pod":"([^"]+)".*/\1/')

    echo "peticion $i -> $POD"
    echo "$POD" >> "$TMP_FILE"
done

echo
echo "== Peticiones por Pod =="

sort "$TMP_FILE" | uniq -c

rm "$TMP_FILE"
