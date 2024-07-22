#!/bin/sh

PROGRAM_NAME=$1
RECORD_SECS=$2
#DEST_DIR=$3/$1`date +_%y%m`
DEST_DIR=$3

FFMPEG=/usr/local/ffmpeg/bin/ffmpeg
RADIO_ADDR="http://ebsonairiosaod.ebs.co.kr/fmradiobandiaod/bandiappaac/playlist.m3u8"
RADIO_ADDR="https://ebsonair.ebs.co.kr/fmradiofamilypc/familypc1m/chunklist.m3u8"
TITLE=$PROGRAM_NAME`date "+ %Y.%_m.%_d."`
DEST_FILE=$PROGRAM_NAME`date +_%y%m%d`.m4a

if [ ! -d "$DEST_DIR" ] ; then
  mkdir -p "$DEST_DIR"
#  synoindex -A "$3"
fi

$FFMPEG -i $RADIO_ADDR -t $RECORD_SECS -codec:a copy -vn -metadata title="$TITLE" -metadata date=`date +%F` "$DEST_DIR/$DEST_FILE"

#synoindex -a "$DEST_DIR/$DEST_FILE"
