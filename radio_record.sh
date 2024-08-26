#!/bin/bash

NAME=$1
SECS=$2
OUT_DIR=$3
URL=$4

FFMPEG=/usr/local/ffmpeg/bin/ffmpeg

ABS_PATH=$(readlink -f "$0")
ABS_DIR=$(dirname "$ABS_PATH")

RECORD_DIR=$ABS_DIR/$OUT_DIR
if [ ! -d "$RECORD_DIR" ] ; then
    mkdir -p "$RECORD_DIR"
fi

LOG_DIR=$ABS_DIR/log
if [ ! -d "$LOG_DIR" ] ; then
    mkdir -p "$LOG_DIR"
fi

TITLE=$NAME`date "+_%Y.%m.%d"`
#RECORD_FILE=$RECORD_DIR/$NAME`date +_%Y%m%d`.m4a
RECORD_FILE=$RECORD_DIR/$NAME`date +_%Y%m%d`.mp3
LOG_FILE=$LOG_DIR/$NAME".log"

# To renew the log file
echo "-----" > $LOG_FILE
function log() {
    STR=$1:$2
    echo $STR
    echo $STR >> $LOG_FILE
}

log NAME $NAME
log SECS $SECS
log URL $URL
log RECORD_FILE $RECORD_FILE
log LOG_FILE $LOG_FILE
log CMD "$FFMPEG -i $URL -t $SECS -vn -acodec mp3 -metadata title="$TITLE" -metadata date=`date +%F` "$RECORD_FILE""
log "-----"

#$FFMPEG -i $URL -t $SECS -codec:a copy -vn -metadata title="$TITLE" -metadata date=`date +%F` "$RECORD_FILE" >> $LOG_FILE 2>&1
$FFMPEG -i $URL -t $SECS -vn -acodec mp3 -metadata title="$TITLE" -metadata date=`date +%F` "$RECORD_FILE" >> $LOG_FILE 2>&1
