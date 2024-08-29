#!/bin/sh

NAME=MBC_star_night
SECS=7200
OUT_DIR=data

URL=""
attempt=0
max_attempt=5

while [ -z "$URL" ] && [ "$attempt" -lt "$max_attempt" ]; do
    output=$(curl -s 'http://serpent0.duckdns.org:8088/mbcfm.pls')
    URL=$(echo "$output" | grep '^File1=' | sed 's/File1=//')
    attempt=$((attempt+1))
done

ABS_PATH=$(readlink -f "$0")
ABS_DIR=$(dirname "$ABS_PATH")

$ABS_DIR/radio_record.sh $NAME $SECS $OUT_DIR $URL
