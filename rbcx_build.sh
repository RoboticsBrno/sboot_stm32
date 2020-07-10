#!/bin/sh
set -exu

make clean

make \
    DFU_BOOTSTRAP_GPIO=GPIOD \
    DFU_BOOTSTRAP_PIN=10 \
    DFU_CIPHER=_DISABLE \
    DFU_BOOTSTRAP_PULL=_HIGH \
    DFU_INTF_EEPROM=_DISABLE \
    DFU_DNLOAD_NOSYNC=_DISABLE \
    DFU_DBLRESET_MS=_DISABLE \
    rbcx_v11

if [ "$#" -ge "1" ] && [ "$1" = "pre" ]; then
    mkdir -p prebuilt/rbcx_v11
    cp -a build/firmware.* prebuilt/rbcx_v11/
fi
