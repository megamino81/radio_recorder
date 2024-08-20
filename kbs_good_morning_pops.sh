#!/bin/sh

NAME=KBS_good_morning_pops
SECS=3600
OUT_DIR=data
URL="http://serpent0.duckdns.org:8088/kbs2fm.pls"

./radio_record.sh $NAME $SECS $OUT_DIR $URL
