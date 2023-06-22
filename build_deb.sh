#!/bin/sh

DIR=$1

dpkg-deb -b $DIR new.deb
