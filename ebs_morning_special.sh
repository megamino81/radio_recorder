#!/bin/sh

NAME=EBS_morning_special
SECS=7200
OUT_DIR=data
URL="https://ebsonair.ebs.co.kr/fmradiofamilypc/familypc1m/chunklist.m3u8"

ABS_PATH=$(readlink -f "$0")
ABS_DIR=$(dirname "$ABS_PATH")

$ABS_DIR/radio_record.sh $NAME $SECS $OUT_DIR $URL