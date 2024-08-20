#!/bin/sh

NAME=KBS_good_morning_pops
SECS=3600
OUT_DIR=data
URL="http://serpent0.duckdns.org:8088/kbs2fm.pls"

ABS_PATH=$(readlink -f "$0")
ABS_DIR=$(dirname "$ABS_PATH")

$ABS_DIR/radio_record.sh $NAME $SECS $OUT_DIR $URL
