#!/bin/sh

# Ensure configfs is mounted
if ! mountpoint -q /config; then
    mount -t configfs none /config || exit 1
fi

# Make a directory and set owner to system usb per /vendor/etc/init/hw/init.qcom.usb.rc
makeDir() {
    path="$1"
    mode="${2:-0770}"
    owner="${3:-system:usb}"

    if [ ! -d "$path" ]; then
        mkdir -p -m "$mode" "$path" 2>/dev/null
        chown "$owner" "$path" 2>/dev/null
    fi
}

# Set owner to system usb per /vendor/etc/init/hw/init.qcom.usb.rc
chownPath() {
    target="$1"
    owner="${2:-system:usb}"

    if [ -e "$target" ]; then
        chown "$owner" "$target" 2>/dev/null
    fi
}

makeDir /config/usb_gadget
makeDir /config/usb_gadget/g1
chownPath /config/usb_gadget/g1/UDC
chownPath /config/usb_gadget/g1/bDeviceClass
chownPath /config/usb_gadget/g1/bDeviceProtocol
chownPath /config/usb_gadget/g1/bDeviceSubClass
chownPath /config/usb_gadget/g1/bMaxPacketSize0
chownPath /config/usb_gadget/g1/bcdDevice
chownPath /config/usb_gadget/g1/bcdUSB
chownPath /config/usb_gadget/g1/configs
chownPath /config/usb_gadget/g1/functions
chownPath /config/usb_gadget/g1/idProduct
chownPath /config/usb_gadget/g1/idVendor
chownPath /config/usb_gadget/g1/max_speed
chownPath /config/usb_gadget/g1/os_desc
chownPath /config/usb_gadget/g1/strings
makeDir /config/usb_gadget/g1/strings/0x409
chownPath /config/usb_gadget/g1/strings/0x409/manufacturer
chownPath /config/usb_gadget/g1/strings/0x409/product
chownPath /config/usb_gadget/g1/strings/0x409/serialnumber
makeDir /config/usb_gadget/g1/functions/mass_storage.0
makeDir /config/usb_gadget/g1/functions/mtp.gs0
makeDir /config/usb_gadget/g1/functions/ptp.gs1
makeDir /config/usb_gadget/g1/functions/accessory.gs2
makeDir /config/usb_gadget/g1/functions/audio_source.gs3
makeDir /config/usb_gadget/g1/functions/midi.gs5
chownPath /config/usb_gadget/g1/functions/midi.gs5/buflen
chownPath /config/usb_gadget/g1/functions/midi.gs5/id
chownPath /config/usb_gadget/g1/functions/midi.gs5/in_ports
chownPath /config/usb_gadget/g1/functions/midi.gs5/index
chownPath /config/usb_gadget/g1/functions/midi.gs5/out_ports
chownPath /config/usb_gadget/g1/functions/midi.gs5/qlen
makeDir /config/usb_gadget/g1/functions/ffs.adb
makeDir /config/usb_gadget/g1/functions/ffs.diag
makeDir /config/usb_gadget/g1/functions/ffs.diag_mdm
makeDir /config/usb_gadget/g1/functions/ffs.diag_mdm2
makeDir /config/usb_gadget/g1/functions/diag.diag
makeDir /config/usb_gadget/g1/functions/diag.diag_mdm
makeDir /config/usb_gadget/g1/functions/diag.diag_mdm2
makeDir /config/usb_gadget/g1/functions/cser.dun.0
makeDir /config/usb_gadget/g1/functions/cser.nmea.1
makeDir /config/usb_gadget/g1/functions/cser.dun.2
makeDir /config/usb_gadget/g1/functions/gsi.rmnet
makeDir /config/usb_gadget/g1/functions/gsi.rndis
makeDir /config/usb_gadget/g1/functions/gsi.dpl
makeDir /config/usb_gadget/g1/functions/qdss.qdss
makeDir /config/usb_gadget/g1/functions/qdss.qdss_mdm
makeDir /config/usb_gadget/g1/functions/qdss.qdss_sw
chownPath /config/usb_gadget/g1/functions/qdss.qdss/enable_debug_inface
chownPath /config/usb_gadget/g1/functions/qdss.qdss_mdm/enable_debug_inface
chownPath /config/usb_gadget/g1/functions/qdss.qdss_sw/enable_debug_inface
makeDir /config/usb_gadget/g1/functions/rndis_bam.rndis
makeDir /config/usb_gadget/g1/functions/rndis.rndis
makeDir /config/usb_gadget/g1/functions/rmnet_bam.rmnet
makeDir /config/usb_gadget/g1/functions/rmnet_bam.dpl
makeDir /config/usb_gadget/g1/functions/rmnet_bam.rmnet_bam_dmux
makeDir /config/usb_gadget/g1/functions/rmnet_bam.dpl_bam_dmux
makeDir /config/usb_gadget/g1/functions/ncm.gs6
chownPath /config/usb_gadget/g1/functions/ncm.gs6/host_addr
chownPath /config/usb_gadget/g1/functions/ncm.gs6/ifname
chownPath /config/usb_gadget/g1/functions/ncm.gs6/os_desc
chownPath /config/usb_gadget/g1/functions/ncm.gs6/dev_addr
chownPath /config/usb_gadget/g1/functions/ncm.gs6/os_desc/interface.ncm
chownPath /config/usb_gadget/g1/functions/ncm.gs6/os_desc/interface.ncm/compatible_id
chownPath /config/usb_gadget/g1/functions/ncm.gs6/os_desc/interface.ncm/sub_compatible_id
chownPath /config/usb_gadget/g1/functions/ncm.gs6/qmult
makeDir /config/usb_gadget/g1/functions/ccid.ccid
makeDir /config/usb_gadget/g1/functions/uac1.uac1
makeDir /config/usb_gadget/g1/functions/uac2.0
makeDir /config/usb_gadget/g1/functions/uvc.0
makeDir /config/usb_gadget/g1/configs/b.1
chownPath /config/usb_gadget/g1/configs/b.1/MaxPower
chownPath /config/usb_gadget/g1/configs/b.1/bmAttributes
chownPath /config/usb_gadget/g1/configs/b.1/strings
chownPath /config/usb_gadget/g1/os_desc/b.1
chownPath /config/usb_gadget/g1/os_desc/b_vendor_code
chownPath /config/usb_gadget/g1/os_desc/qw_sign
chownPath /config/usb_gadget/g1/os_desc/use
makeDir /config/usb_gadget/g1/configs/b.1/strings/0x409
chownPath /config/usb_gadget/g1/configs/b.1/strings/0x409/configuration

exit 0
