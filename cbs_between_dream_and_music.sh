#!/bin/sh

NAME=CBS_between_dream_and_music
SECS=7200
OUT_DIR=data
URL="http://aac.cbs.co.kr/cbs939/_definst_/cbs939.stream/playlist.m3u8"

./radio_record.sh $NAME $SECS $OUT_DIR $URL