#!/bin/bash

remote_size() {
    adb shell stat -c %s /sdcard/cellmapper/$1
}

local_size() {
    stat -c %s $1
}

FILES=$(adb shell ls -1 /sdcard/cellmapper/ | grep -v "^*")
for file in $FILES ; do
    if [ ! -f "$file" ] ; then
	adb pull "/sdcard/cellmapper/$file"
    elif [ "$(local_size $file)" -ne "$(remote_size $file)" ]; then
        adb pull "/sdcard/cellmapper/$file"
    else
	echo "files are the same here and there" $file
    fi
done
