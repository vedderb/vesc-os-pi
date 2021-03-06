################################################################################
#
# vesc-tool
#
################################################################################

VESC_TOOL_VERSION = 654bcbe871c7061dc7000a7e4700473e96e92f4f
VESC_TOOL_SITE = $(call github,vedderb,vesc_tool,$(VESC_TOOL_VERSION))
VESC_TOOL_LICENSE = GPLv3
VESC_TOOL_LICENSE_FILES = LICENSE

VESC_TOOL_CONF_OPTS += -config release "CONFIG += release_lin build_original"

define VESC_TOOL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/lin/vesc_tool_* $(TARGET_DIR)/usr/bin/vesc_tool
endef

$(eval $(qmake-package))
