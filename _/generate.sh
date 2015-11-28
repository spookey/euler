#!/usr/bin/env bash

set -e

BDIR=$(cd "$(dirname "$0")"; pwd)
TIME=${TIME-"/usr/bin/time"}
NUM=${NUM="100"}

OUT=${OUT-""}
RES=$(cat "$BDIR/html.tpl")

LABELS=""; DREAL=""; DUSER=""; DSYS=""


if [ -z "$1" ] || [ -z "$OUT" ]; then
    echo "usage: OUT=\"out.html\" $0 cmdline"
    exit 1
fi

for ((I=0; I<=NUM; I++)); do
    echo -en "$1 $I\r"
    R=$($TIME $1 "$I" 2>&1 >/dev/null)
    COMMA="$(if [ $I -ne "$NUM" ]; then echo ", "; fi)"
    LABELS="$LABELS\"$I\"$COMMA"
    DREAL="$DREAL$(awk '{print $1}' <<< "$R")$COMMA"
    DUSER="$DUSER$(awk '{print $3}' <<< "$R")$COMMA"
    DSYS="$DSYS$(awk '{print $5}' <<< "$R")$COMMA"
done

RES="${RES/__creationtime__/$(date)}"
RES="${RES//__cmd__/$*}"
RES="${RES//__num__/$NUM}"
RES="${RES/__lables__/$LABELS}"
RES="${RES/__dreal__/$DREAL}"
RES="${RES//__creal__/#FFB758}"
RES="${RES/__duser__/$DUSER}"
RES="${RES//__cuser__/#E84586}"
RES="${RES/__dsys__/$DSYS}"
RES="${RES//__csys__/#3B30FF}"

echo -n "$RES" > "$OUT"
