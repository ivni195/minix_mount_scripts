#!/bin/bash
MINIX_IMAGE_FILENAME="minix203.img"
MINIX_FS_MNT_DIR="minixfs"

if [ "$EUID" -ne 0 ]; then
	echo "This script must be run as root."
fi

mkdir -p minixfs
loop=$(losetup --find --show --offset 8704 $MINIX_IMAGE_FILENAME)
echo $loop > /tmp/loopname
echo "$MINIX_IMAGE_FILENAME attached to loop device $loop."
echo "Mounting partitions..."
mount -t minix -o offset=512,sizelimit=1474048 $loop $MINIX_FS_MNT_DIR
mount -t minix -o offset=1475072 $loop $MINIX_FS_MNT_DIR/usr
echo "Minix filesystem mounted in $MINIX_FS_MNT_DIR"
