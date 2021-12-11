################################################################################
#
# qt5gamepad
#
################################################################################

# todo: evdev dependency

QT5GAMEPAD_VERSION = $(QT5_VERSION)
QT5GAMEPAD_SITE = $(QT5_SITE)
QT5GAMEPAD_SOURCE = qtgamepad-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5GAMEPAD_VERSION).tar.xz
QT5GAMEPAD_INSTALL_STAGING = YES

QT5GAMEPAD_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
QT5GAMEPAD_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL

$(eval $(qmake-package))