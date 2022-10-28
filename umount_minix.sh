#!/bin/bash

MINIX_FS_MNT_DIR="minixfs"

if [ "$EUID" -ne 0 ]; then
	echo "This script must be run as root."
	exit 1
fi

umount --recursive $MINIX_FS_MNT_DIR
loop=$(cat /tmp/loopname)
losetup -d $loop
echo "Minix fs unmounted."
