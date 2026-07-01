# fix display
mount -o bind /lib/linkerconfig/manifest.xml /vendor/etc/vintf/manifest.xml

# fix tad
chmod 666 /dev/sda1
