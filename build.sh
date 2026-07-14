#!/bin/bash
set -xe
[ -d build ] || git clone https://gitlab.com/ubports/porting/community-ports/halium-generic-adaptation-build-tools build
./build/build.sh -b workdir "$@"
./build/prepare-fake-ota.sh ./out/device_b2q.tar.xz ota
./build/system-image-from-ota.sh ota/ubuntu_command out
mv out/rootfs.img out/ubuntu.img
