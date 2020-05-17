#!/bin/bash

ARCH="x86_64"
ROOTFS_VER="2020.04.01"
ROOTFS_FN="archlinux-bootstrap-${ROOTFS_VER}-${ARCH}.tar.gz"
ROOTFS_URL="http://mirrors.kernel.org/archlinux/iso/${ROOTFS_VER}/${ROOTFS_FN}"


PAC_PKGS="base less nano sudo vim curl iputils alterlinux-keyring alterlinux-calamares aptpac libpwquality yay-bin fakeroot"

if type curl >/dev/null 2>&1 ;then
    DLR="curl"
fi
if type wget >/dev/null 2>&1;then
    DLR="wget"
fi
if type aria2c >/dev/null 2>&1; then
    DLR="aria2c -x4"
fi


