# These and other macros are documented in ../droid-configs-device/droid-configs.inc
# Feel free to cleanup this file by removing comments, once you have memorised them ;)

%define device pdx225
%define rpm_device xqcc72
%define vendor sony

%define vendor_pretty Sony
%define device_pretty Xperia 10 IV

%define android_version_major 15

%define droid_target_aarch64 1

# Community HW adaptations need this
%define community_adaptation 1

# Device-specific usb-moded configuration
Provides: usb-moded-configs
Obsoletes: usb-moded-defaults

# Device-specific ofono configuration
Provides: ofono-configs
Obsoletes: ofono-configs-mer
Obsoletes: ofono-configs-binder

Requires: libgbinder-tools

# Pixel ratio 1.0 was originally jolla phone with 245ppi, and the devices
# should roughly have their ppi compared to that. Large displays can use
# bigger ratio if seen fit. Values are with 0.25 increments.
%define pixel_ratio 1.75

%include droid-configs-device/droid-configs.inc
%include patterns/patterns-sailfish-device-adaptation-xqcc72.inc
%include patterns/patterns-sailfish-device-configuration-xqcc72.inc

# IMPORTANT if you want to comment out any macros in your .spec, delete the %
# sign, otherwise they will remain defined! E.g.:
#define some_macro "I'll not be defined because I don't have % in front"

