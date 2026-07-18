VALID_PRODUCTS=(@VALID_PRODUCTS@)

FLASH_OPS=(
"getvar_fail_if secure yes"
"run fastboot reboot fastboot"
"flash boot_a hybris-boot.img"
"flash dtbo_a dtbo.img"
"flash userdata sailfish.img001"
)

GETVAR_ERROR_secure="
This device has not been unlocked, but you need that for flashing.
Please go to https://opendevices.sony.net/aosp-on-xperia-open-devices/get-started/unlock-bootloader and see instructions how to unlock your device.
"

FLASH_COMPLETED_MESSAGE="
Remove the USB cable and bootup the device by pressing powerkey.
"
