#!/bin/sh

NAME=MBC_star_night
SECS=7200
OUT_DIR=data

#URL="http://serpent0.duckdns.org:8088/mbcfm.pls"
output=$(curl -s 'http://serpent0.duckdns.org:8088/mbcfm.pls')
URL=$(echo "$output" | grep '^File1=' | sed 's/File1=//')


ABS_PATH=$(readlink -f "$0")
ABS_DIR=$(dirname "$ABS_PATH")

$ABS_DIR/radio_record.sh $NAME $SECS $OUT_DIR $URL
