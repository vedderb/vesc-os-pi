#!/bin/bash

set -e

cp -R ${BR2_EXTERNAL_VESC_OS_PATH}/scripts/net/S01ipconf ${TARGET_DIR}/etc/init.d/

if ! grep -qE '^PermitRootLogin' "${TARGET_DIR}/etc/ssh/sshd_config"; then
cat << __EOF__ >> "${TARGET_DIR}/etc/ssh/sshd_config"

# Permit root login
PermitRootLogin yes

__EOF__
fi

exit $?
