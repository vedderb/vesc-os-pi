#!/bin/bash

set -e

if ! grep -qE '^ignore_lcd' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# Waveshare 7-inch 1024x600 DSI LCD
ignore_lcd=1
dtoverlay=WS_7inchDSI1024x600_Screen
dtparam=i2c_arm=on
dtoverlay=WS_7inchDSI1024x600_Touch
__EOF__
fi

cp -R ${BR2_EXTERNAL_VESC_OS_PATH}/scripts/wh7_lcd_1024_600/lib_pi4/* ${TARGET_DIR}/lib
cp -R ${BR2_EXTERNAL_VESC_OS_PATH}/scripts/wh7_lcd_1024_600/dtbo_pi4/* ${BINARIES_DIR}/rpi-firmware/overlays

exit $?
