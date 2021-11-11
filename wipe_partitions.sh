echo "wiping partitions from $1"
wipefs -a $1
dd if=/dev/zero of=$1 bs=512 count=1 conv=notrunc
