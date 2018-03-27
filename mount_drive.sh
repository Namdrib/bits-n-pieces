#!/bin/bash

# For WSL!

# Used to mount a drive d that exists in Windows into mnt/d
# Run like `./mount_drive.sh d` where d is your drive designation

# https://www.scivision.co/mount-usb-drives-windows-subsystem-for-linux/

# take from first arg, otherwise default to n
drive=${1:-n}
echo "$drive"

if [ ! -d "/mnt/$drive" ] ;then
	sudo mkdir "/mnt/$drive"
fi
sudo mount -t drvfs "$drive:" "/mnt/$drive"
