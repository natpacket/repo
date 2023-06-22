#!/bin/sh

DEL_FILE_DIR=$1
DEL_FILE_NAME=$2
echo "starting find the file..."

find $DEL_FILE_DIR -type f -name $DEL_FILE_NAME

find $DEL_FILE_DIR -type f -name $DEL_FILE_NAME -delete

