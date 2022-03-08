## VESC-OS-PI

This uses [Buildroot](https://buildroot.org/) to make a minimal Linux image with just enough packages to run VESC Tool on the Raspberry Pi 3 or 4. The filesystem is read-only to prevent SD-card corruption during power cycles.

VESC Tool runs in scripting mode where it waits for a VESC-connection over USB. Once a connection is established the custom QML UI from the connected VESC is loaded and shown on the screen (if it exists, otherwise the screen remains blank until a VESC with a QML UI is connected). If USB is disconnected VESC Tool attempts to reconnect again every second until a connection is established again, at which point it will try to load the QML UI from the VESC again.

This is suitable for using the Raspberry Pi as e.g. a dashboard for a car, motorcycle, go-kart, CNC-lathe or anything with motor that needs a touch screen interface with a UI created in the scripting page of VESC Tool.

## Requirements

For buildroot [https://buildroot.org/downloads/manual/manual.html#requirement-mandatory](https://buildroot.org/downloads/manual/manual.html#requirement-mandatory)

These should be installed on most Linux-systems and/or easy to find. On debian-based systems, such as Ubuntu, a good start is

```
sudo apt install build-essential
```

## Build the image

Clone the repository

```
git clone git@github.com:vedderb/vesc-os-pi.git
cd vesc-os-pi
git submodule update --init
cd buildroot
```

Build for Raspberry Pi 3 using 12 cores:

```
make BR2_EXTERNAL=../ vesc_rpi3_defconfig
make BR2_EXTERNAL=../ BR2_JLEVEL=12
```

or build for Raspberry Pi 4 using 12 cores:

```
make BR2_EXTERNAL=../ vesc_rpi4_defconfig
make BR2_EXTERNAL=../ BR2_JLEVEL=12
```

### Variants
The commands above will generate an image that starts VESC Tool in Qml UI mode. It is also possible to start the mobile version or the full desktop version by using one of the following configs (depending on your raspberry pi version)

```
vesc_rpi3_mobile_defconfig
vesc_rpi3_full_defconfig
vesc_rpi4_mobile_defconfig
vesc_rpi4_full_defconfig
```

## Write to SD Card

The generated image will be in `buildroot/output/images/sdcard.img`. To write the image to the SD card, use:

```
sudo dd if=output/images/sdcard.img of=/dev/[card_id] bs=1M
```

Make sure to wait for the copy to finish before unplugging the card. Also make sure that the device you write the image to really is the SD-card and not some other drive - dd is happy to overwrite all data you point it at without asking you.

One way to find \[card_id\] is to run

```
dmesg -w
```

and then plug in the card. It will usually show up as something like /dev/sda or /dev/mmcblk0