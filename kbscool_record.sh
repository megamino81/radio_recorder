#!/bin/sh

PROGRAM_NAME=$1
RECORD_SECS=$2
#DEST_DIR=$3/$1`date +_%y%m`
DEST_DIR=$3

#FFMPEG=/volume1/@appstore/ffmpeg/bin/ffmpeg
FFMPEG=/usr/local/ffmpeg/bin/ffmpeg

#RADIO_ADDR="https://2fm.gscdn.kbs.co.kr/2fm_192_3.m3u8?Expires=1691247569&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly8yZm0uZ3NjZG4ua2JzLmNvLmtyLzJmbV8xOTJfMy5tM3U4IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjkxMjQ3NTY5fX19XX0_&Signature=ByoayhjUGUe8IJf3rmwmfrNbFCniORYeI~2jeqPF~KmrUA2BKGeqiwsNDRxdvTYBJJOBvV972uEWv513DO1~uErZKyVo8xhOef~2tBXGMIF6mGCMfGcjztQDaS7rXJs8HHKjR6Haq898e2ZOTCH1Pz7T2Pp1tkXPzMf~lxp3I~2LyHUY2-sMV-pCqj4HkJzWf-bFnEFCdKP3UdXFaXFOZ68RhQ8CU5Tl49rHAz8GBCIHn6kj-00piIv6mvMGJyqsy4Du2EHrqOJmfk8lXHRzAVTtMQWT7uL87BVi~gIzcqmh-KrbKfNpfW34d-X5mHk2bJCJ8MP84yWws3ox5VzEoQ__&Key-Pair-Id=APKAICDSGT3Y7IXGJ3TA"

RADIO_ADDR=`python /volume1/Downloads/Records/urlparse.py`

TITLE=$PROGRAM_NAME`date "+ %Y.%_m.%_d."`
DEST_FILE=$PROGRAM_NAME`date +_%y%m%d`.m4a

if [ ! -d "$DEST_DIR" ] ; then
  mkdir -p "$DEST_DIR"
#  synoindex -A "$3"
fi

$FFMPEG -i $RADIO_ADDR -t $RECORD_SECS -codec:a copy -vn -metadata title="$TITLE" -metadata date=`date +%F` "$DEST_DIR/$DEST_FILE"

#synoindex -a "$DEST_DIR/$DEST_FILE"
