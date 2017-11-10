#!/bin/bash

LOCATION=$1
TARGET=$2
VERSION=$3

[ -z "$LOCATION" ] && LOCATION="."
[ -z "$TARGET" ] && TARGET="app"
[ -z "$VERSION" ] && VERSION="0.0.0"

FILE=$LOCATION/${TARGET}_VERSION.h
NUMBER=0
DATE_CODE=`date +%Y%m%d`

echo "output file to $FILE"

if [ -e "$FILE" ]; then
	LAST_DATE=`stat -c %z "$FILE" | awk '{print $1}' | sed 's/-//g'`
	NUMBER=`cat "$FILE" | grep "BUILD_NUMBER" | awk '{print $3}'`
echo "Number=$NUMBER"
	[ -z "$NUMBER" ] && NUMBER=0
	if [ "$LAST_DATE" = "$DATE_CODE" ];then
		NUMBER=$((NUMBER + 1))
	fi
fi
echo "result=$NUMBER"

echo "" > $FILE
echo "//=================================================" 			>> $FILE
echo "//This file is auto generate by build number script" 			>> $FILE
echo "//=================================================" 			>> $FILE
echo "" >> $FILE
if [ $NUMBER -gt 0 ]; then
	echo "#define	BUILD_NUMBER	$NUMBER" 				>> $FILE
	echo "#define	DATE_CODE	$DATE_CODE"				>> $FILE
	echo "#define	_VERSION_	${VERSION}.${DATE_CODE}-$NUMBER" 	>> $FILE
else
	echo "#define	DATE_CODE	$DATE_CODE"				>> $FILE
	echo "#define	_VERSION_	${VERSION}.${DATE_CODE}" 		>> $FILE
fi



