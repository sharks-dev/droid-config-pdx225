#!/bin/sh

# This script should get usb-moded stable, at least to the point where MTP works reliably
# Developer mode still in the works.

mkdir -p "/config"

if ! mountpoint -q "/config"; then
    mount -t configfs none "/config"
fi

mkdir -p "/config/usb_gadget/g1/strings/0x409"
mkdir -p "/config/usb_gadget/g1/configs/c.1/strings/0x409"

exit 0
