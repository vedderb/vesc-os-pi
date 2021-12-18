#!/bin/bash

set -e

if ! grep -qE '^disable_splash=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# Disable boot rainbow
disable_splash=1
__EOF__
fi

if ! grep -qE 'fbcon=' "${BINARIES_DIR}/rpi-firmware/cmdline.txt"; then
sed -i ' 1 s/.*/& fbcon=map:2/' "${BINARIES_DIR}/rpi-firmware/cmdline.txt"
fi

exit $?
