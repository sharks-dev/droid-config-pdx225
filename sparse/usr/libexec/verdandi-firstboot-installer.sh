#!/bin/bash

DCONF_KEY="/apps/firstboot/install_packages"

# Get dconf key from hijacked jolla-startupwizard
RAW_VAL=$(XDG_CONFIG_HOME=/home/defaultuser/.config runuser -u defaultuser -- dconf read "$DCONF_KEY" 2>/dev/null)

if [ -n "$PACKAGES" ] && [ "$PACKAGES" != "@as" ]; then
    echo "Firstboot installer: Found packages to install: $PACKAGES"
    
    # Install packages
    pkcon refresh
    pkcon install -y $PACKAGES

    # Clear the dconf key
    XDG_CONFIG_HOME=/home/defaultuser/.config runuser -u defaultuser -- dconf reset "$DCONF_KEY"
else
    echo "Firstboot installer: No packages selected."
fi
