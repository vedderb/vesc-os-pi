#!/bin/bash

set -e

if ! grep -qE '^dtoverlay=vc4-fkms-v3d' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# Activate vc4 gpu driver
dtoverlay=vc4-fkms-v3d
__EOF__
fi

exit $?
